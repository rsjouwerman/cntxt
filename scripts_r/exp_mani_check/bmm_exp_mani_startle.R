# load packages
library(ggplot2)
library(brms)
library(dplyr)
library(sjPlot)
library(emmeans)

# load data
out_measure <- 'startle'
load("~/BouCon_All/RdataManiCheck/raw_fps_single_trial.Rdata")
source(here::here('scripts_r/exp_mani_check/contrasts_exp_mani_check.R'))
dat <- dfps
dat$trial <- factor(paste(dat$expPhase, dat$bin1, sep ='_'), 
                    levels = c('hab_1',
                               'acq_1','acq_2','acq_3','acq_4','acq_5','acq_6',
                               'ext_1','ext_2','ext_3','ext_4','ext_5','ext_6',
                               'rei_1',
                               'tst_1','tst_2','tst_3','tst_4'))

dat$stimType <- factor(dat$stimType)
ggplot(dat, aes(x = trial, y = amplitude_t)) +
  geom_point(aes(color = stimType)) +
  geom_line(aes(group = idNum, color = stimType))

# means
dat_summary <- dat %>% group_by(trial, stimType) %>%
  summarise(mean_value <- mean(amplitude_t, na.rm = T) ) %>%
  data.frame()
names(dat_summary)[3] <- 'mean_value'
ggplot(dat_summary, aes(x = trial, y = mean_value)) +
  geom_point(aes(color = stimType)) 


#dat <- droplevels(dat[dat$expPhase == 'acq',])
dat <- droplevels(dat[dat$expPhase %in% c('acq','ext') & dat$bin1 == 6,])
dat <- droplevels(dat[dat$context %in% c('AAAB','AABB','AABA') & 
                        dat$numShockRi %in% c(0,1) &
                        dat$stimType %in% c('csp','csm'),])
#dat <- droplevels(dat[dat$bin1 == 3,])
# m1 <- lmer(valueConfZ ~ trial * stimType + (1 | idNum), data = dat)
# tab_model(m1)

# models with only one timepoint, i.e., trial, last acquistion or last extinction
# redundant
# b1 <- brm(valueConfZ ~ stimType + (1 | idNum), data = dat)
# b2 <- brm(valueConfZ ~ stimType + (1 + stimType | idNum), data = dat)
# b5 <- brm(valueConfZ ~ stimType *context * numShockRi + (1 + stimType | idNum), data = dat)
# 
# tab_model(b1,b2,b5)

## define models
set.seed(321)
seed_def <- 321
response_var_def <- 'amplitude_t'
model_formula_0 <- paste0(response_var_def,' ~ 1 + (1| idNum) ')
model_formula_1 <- paste0(response_var_def,' ~ trial * stimType * context * numShockRi + (1 | idNum)')


Sys.time()
b0 <- brm(eval(model_formula_1), data = dat, seed = seed_def)
b1 <- update(b0, . ~ . - (1 | idNum) + (1 + stimType | idNum), seed = seed_def)
b2 <- update(b0, . ~ . - (1 | idNum) + (1 + trial | idNum), seed = seed_def)
b3 <- update(b0, . ~ . - (1 | idNum) + (1 + stimType + trial | idNum), seed = seed_def, iter = 8000)
b4 <- update(b0, . ~ . - (1 | idNum) + (1 + stimType * trial | idNum), seed = seed_def,control = list(adapt_delta = .99), iter = 8000)
Sys.time()

tab_model(b0,b1,b2,b3,b4)
b0 <- add_criterion(b0, 'waic')
b1 <- add_criterion(b1, 'waic')
b2 <- add_criterion(b2, 'waic')
b3 <- add_criterion(b3, 'waic')
b4 <- add_criterion(b4, 'waic')

fit_compared <- loo_compare(b0,b1,b2,b3,b4, criterion = 'waic')

print(fit_compared, digits = 3, simplify = F)
best_fit <- row.names(fit_compared)[1]
best_fit <- b3

mod_nam <- here::here('models','exp_mani_check',paste0(out_measure))
save(best_fit, file = paste0(mod_nam, '.R'))
###
# select estimates for all contrasts
contrast_estimates_general <- pairs(emmeans(best_fit, ~ trial * stimType))
contrast_estimates_groups <- pairs(emmeans(best_fit, ~ trial * stimType * context * numShockRi))

# select estimates for contrasts of interest
contrast_index_general <- contrast_estimates_general@levels[["contrast"]] %in% contrasts_man_check_general
contrast_index_groups <- contrast_estimates_groups@levels[["contrast"]] %in% contrasts_man_check_groups

# build dataframe
dat_general <- data.frame(contrast_estimates_general[contrast_index_general]) %>%
  droplevels()
dat_general$contrast <- factor(dat_general$contrast, levels = rev(contrasts_man_check_general))
dat_general$type <- c('CS + change','CS discr', 'CS discr','CS - change')

dat_groups <- data.frame(contrast_estimates_groups[contrast_index_groups]) %>%
  droplevels()
# add grouping vars - context
dat_groups[grep('AAAB', dat_groups$contrast), 'context'] <- 'AAAB'
dat_groups[grep('AABB', dat_groups$contrast), 'context'] <- 'AABB'
dat_groups[grep('AABA', dat_groups$contrast), 'context'] <- 'AABA'

dat_groups$context <- factor(dat_groups$context, levels = c('AAAB','AABB','AABA'))
# add grouping vars - reinstatement / control
dat_groups[grep(',1', dat_groups$contrast), 'ri_group'] <- 'reinstatement'
dat_groups[grep(',0', dat_groups$contrast), 'ri_group'] <- 'control'

dat_groups$contrast <- factor(dat_groups$contrast, levels = contrasts_man_check_groups)
dat_groups$type <- rep(c('CS + change','CS discr', 'CS discr','CS - change'),6)

# Plotting
# set specifics
col_zero_line <- 'black'
type_zero_line <- 'dotted'
size_zero_line <- 1
size_symbol <- 4
size_bar <- 5.5
context_colors <- c("#383838", "#FF00F2", "#55BDE0")
col_csp = diverging_hcl(palette = 'Blue-Red 2', n = 2)[2]
col_csm = diverging_hcl(palette = 'Blue-Red 2',n = 2)[1]
colors_conditions <- c(col_csm, col_csp,'grey50','grey5')
colors_conditions <- c('blue', 'red','grey50','grey5')

# plot 1
# label contrasts
lab_names_pos <- c("acq_6,csp - acq_6,csm" = "CS+ vs CS- end acq",
                   "ext_6,csp - ext_6,csm" = "CS+ vs CS- end ext",
                   "acq_6,csp - ext_6,csp" = "CS+ acq vs ext",
                   "acq_6,csm - ext_6,csm" = "CS- acq vs ext")


p_all <- ggplot(dat_general, aes(x = estimate, y = contrast)) + 
  geom_errorbarh(aes(xmin = lower.HPD, xmax = upper.HPD, color = contrast), size = size_bar, height = 0) +
  
  geom_point(size = size_symbol, color = 'white', aes(shape = type), fill = 'white') +
  scale_shape_manual(values = c(17,16,23)) +
  geom_vline(xintercept = 0, color = col_zero_line, linetype = type_zero_line, size = size_zero_line) +
  scale_y_discrete(name = paste0(out_measure),
                   labels = lab_names_pos) +
  scale_color_manual(values = colors_conditions) +
  theme_classic() +
  theme(axis.text.x = element_text(size =12),
        axis.text.y = element_blank(),
        axis.title = element_text(size = 14),
        axis.ticks.y = element_blank(),
        legend.position = 'none') 

h <- 2
w <- 4

windows(width = w, height = h)
p_all
file_nam <- here::here('figures','exp_mani_check',paste0('all_',out_measure))
ggsave(p_all, file = paste0(file_nam,'.tiff'), width = w, height = h, dpi = 300)
save(p_all, file = paste0(file_nam,'.R'))

# plot 2
# label contrasts
lab_names_pos <- c('acq_6,csp,AAAB,0 - acq_6,csm,AAAB,0' = 'CS+ vs CS- end acq control AAAB',
                   'ext_6,csp,AAAB,0 - ext_6,csm,AAAB,0' = 'CS+ vs CS- end ext control AAAB', # 'cs discrimination end extinction',
                   'acq_6,csp,AAAB,0 - ext_6,csp,AAAB,0' = 'CS+ acq vs ext control AAAB', # 'cs+ change acq to ext',
                   'acq_6,csm,AAAB,0 - ext_6,csm,AAAB,0' = 'CS- acq vs ext control AAAB',  # cs- change acq to ext
                   
                   # AABB, control group
                   'acq_6,csp,AABB,0 - acq_6,csm,AABB,0'= 'CS+ vs CS- end acq control AABB', # cs discrimination end acquisition
                   'ext_6,csp,AABB,0 - ext_6,csm,AABB,0'= 'CS+ vs CS- end ext control AABB', # cs discrimination end extinction
                   'acq_6,csp,AABB,0 - ext_6,csp,AABB,0'= 'CS+ acq vs ext control AABB', # cs+ change acq to ext
                   'acq_6,csm,AABB,0 - ext_6,csm,AABB,0' = 'CS- acq vs ext control AABB',  # cs- change acq to ext
                   
                   # AABA, control group
                   'acq_6,csp,AABA,0 - acq_6,csm,AABA,0'= 'CS+ vs CS- end acq control AABA', # cs discrimination end acquisition
                   'ext_6,csp,AABA,0 - ext_6,csm,AABA,0'= 'CS+ vs CS- end ext control AABA', # cs discrimination end extinction
                   'acq_6,csp,AABA,0 - ext_6,csp,AABA,0'= 'CS+ acq vs ext control AABA', # cs+ change acq to ext
                   'acq_6,csm,AABA,0 - ext_6,csm,AABA,0'= 'CS- acq vs ext control AABA',  # cs- change acq to ext
                   
                   # AAAB, reinstatement group
                   'acq_6,csp,AAAB,1 - acq_6,csm,AAAB,1' = 'CS+ vs CS- end acq reinstatement AAAB',
                   'ext_6,csp,AAAB,1 - ext_6,csm,AAAB,1' = 'CS+ vs CS- end ext reinstatement AAAB', # 'cs discrimination end extinction',
                   'acq_6,csp,AAAB,1 - ext_6,csp,AAAB,1' = 'CS+ acq vs ext reinstatement AAAB', # 'cs+ change acq to ext',
                   'acq_6,csm,AAAB,1 - ext_6,csm,AAAB,1' = 'CS- acq vs ext reinstatement AAAB',  # cs- change acq to ext
                   
                   # AABB, reinstatement group
                   'acq_6,csp,AABB,1 - acq_6,csm,AABB,1'= 'CS+ vs CS- end acq reinstatement AABB', # cs discrimination end acquisition
                   'ext_6,csp,AABB,1 - ext_6,csm,AABB,1'= 'CS+ vs CS- end ext reinstatement AABB', # cs discrimination end extinction
                   'acq_6,csp,AABB,1 - ext_6,csp,AABB,1'= 'CS+ acq vs ext reinstatement AABB', # cs+ change acq to ext
                   'acq_6,csm,AABB,1 - ext_6,csm,AABB,1' = 'CS- acq vs ext reinstatement AABB',  # cs- change acq to ext
                   
                   # AABA, reinstatement group
                   'acq_6,csp,AABA,1 - acq_6,csm,AABA,1'= 'CS+ vs CS- end acq reinstatement AABA', # cs discrimination end acquisition
                   'ext_6,csp,AABA,1 - ext_6,csm,AABA,1'= 'CS+ vs CS- end ext reinstatement AABA', # cs discrimination end extinction
                   'acq_6,csp,AABA,1 - ext_6,csp,AABA,1'= 'CS+ acq vs ext reinstatement AABA', # cs+ change acq to ext
                   'acq_6,csm,AABA,1 - ext_6,csm,AABA,1'= 'CS- acq vs ext reinstatement AABA')  # cs- change acq to ext


p_groups <- ggplot(dat_groups, aes(x = estimate, y = contrast)) + 
  geom_errorbarh(aes(xmin = lower.HPD, xmax = upper.HPD, 
                     color = contrast), size = 4, height = 0) +
  
  geom_point(size = 3, color = 'white', aes(shape = type)) +
  geom_point(size = 2, aes(shape = type),fill = 'black') +
  scale_shape_manual(values = c(17,16,23)) +
  geom_vline(xintercept = 0, color = col_zero_line, linetype = type_zero_line, size = size_zero_line) +
  scale_y_discrete(name = paste0(out_measure),
                   labels = lab_names_pos) +
  theme_classic() +
  theme(axis.text.x = element_text(size =12),
        axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        legend.position = 'none') +
  # theme(axis.text = element_text(size =12),
  #       axis.title = element_text(size = 14),
  #       legend.position = 'none') +
  scale_color_manual(values = rep(colors_conditions,6))  +
  facet_wrap(.~ ri_group * context,scales = 'free_y') +
  theme(strip.background = element_rect(fill = 'grey47', color = 'grey47'), 
        strip.text = element_text(color = 'white', size = 12))

h <- 4
w <- 8
file_nam <- here::here('figures','exp_mani_check',paste0('groups_',out_measure))
ggsave(p_groups, file = paste0(file_nam,'.tiff'), width = w, height = h, dpi = 300)
save(p_groups, file = paste0(file_nam,'.R'))
###