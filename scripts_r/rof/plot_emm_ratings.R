# Plot estimates RATINGS
# run contet_ratings_1_model markdown
# or load fitted model from BouCon_All/RfittedModels/
load('RfittedModels/fit_rat_wAAAA.Rdata')
#lets rename to fitB5, so I dont need to adjust code
fitB5 <- fit_rat_wAAAA
rm(fit_rat_wAAAA)
out_measure <- 'ratings'
source(here::here('scripts_r/rof/contrasts_emm_wAAAA.R'))

# load libraries
library(emmeans)
library(ggplot2)
library(dplyr)
library(colorspace)
# define width and height for plotting, in inches
# specifics for plotting
context_colors <- c('gray25','slateblue4','slateblue')
context_colors <- c('gray25','turquoise1','#E200FD')
context_colors <- c("#383838", "#FF00F2", "#55BDE0")
#context_colors <- c("#858585", "#FF00F2", "#55BDE0")
context_colors <- c("#55BDE0", "#FF00F2", "#383838")
context_colors <- viridis::viridis(n = 4, option = 'inferno', begin = 0.15, end = 0.85)

col_zero_line <- 'black'

type_zero_line <- 'dotted'

size_zero_line <- 1

h <- 4
w <- 4

eval_fit <- fitB5

# extract contrast for generalized ROF
c_trial_GEN <- pairs(emmeans(eval_fit, ~ trial * context * numShockRi))

con_index_GEN <- c_trial_GEN@levels[["contrast"]] %in% contrasts_of_interest_1

lab_names_pos <- c("ext3,AAAB,1 - tst1,AAAB,1" = "rAAAB",
                   "ext3,AABB,1 - tst1,AABB,1" = "rAABB",
                   "ext3,AABA,1 - tst1,AABA,1" = "rAABA",
                   "ext3,AAAA,1 - tst1,AAAA,1" = "rAAAA",
                   "ext3,AAAB,0 - tst1,AAAB,0" = "cAAAB",      
                   "ext3,AABB,0 - tst1,AABB,0" = "cAABB",      
                   "ext3,AABA,0 - tst1,AABA,0" = "cAABA",
                   "ext3,AAAA,0 - tst1,AAAA,0" = "cAAAA" )

# convert to dataframe
dat <- data.frame(c_trial_GEN[con_index_GEN]) %>%
  droplevels()
# change order of factor levels for plotting
# reinstatement groups first, than control groups
dat$contrast <- factor(dat$contrast, levels = rev(contrasts_of_interest_1))

# add grouping vars
## context
dat[grep('AAAB', dat$contrast), 'context'] <- 'AAAB'
dat[grep('AABB', dat$contrast), 'context'] <- 'AABB'
dat[grep('AABA', dat$contrast), 'context'] <- 'AABA'
dat[grep('AAAA', dat$contrast), 'context'] <- 'AAAA'

dat$context <- factor(dat$context, levels = c('AAAB','AABB','AABA','AAAA'))
## reinstatement / control
dat[grep(',1', dat$contrast), 'ri_group'] <- 'reinstatement'
dat[grep(',0', dat$contrast), 'ri_group'] <- 'control'



# plot
plotGEN <- ggplot(dat, aes(x = estimate, y = contrast)) + 
  geom_errorbarh(aes(xmin = lower.HPD, xmax = upper.HPD, 
                     color = context, alpha = ri_group), size = 6, height = 0) +
  scale_alpha_discrete(range = c(0.35, 1)) +
  
  geom_point(data = dat %>% filter(context == 'AAAB' & ri_group == 'reinstatement'), shape = 'I', size = 10, color = 'white') +
  geom_point(shape = 'I', size = 5, fill = 'black') +
  geom_vline(xintercept = 0, color = col_zero_line, linetype = type_zero_line, size = size_zero_line) +
  scale_y_discrete(name = paste0('ext vs test in ', out_measure),
                   labels = lab_names_pos) +
  theme_classic() +
  theme(axis.text = element_text(size =16),
        axis.title = element_text(size = 18),
        axis.ticks.y = element_blank(),
        legend.position = 'none') +
  scale_color_manual(values = context_colors)

#scale_color_brewer(palette = 'Purples')

# put name of outcome measure left, remove group names
plotGEN <- plotGEN + theme(axis.text.y = element_blank())

# 
#windows(width = w, height = h)
plotGEN

if (save_plot_ind == 1){
  file_nam <- paste0('figures/',out_measure, '_emm_GEN_wAAAA.tiff')
  ggsave(filename = file_nam, plot = plotGEN, width = w, height = h, units = 'in')
}










############## DIFFERENTIAL ROF

# extract contrast DIFF rof
c_trial_DIFF <- pairs(emmeans(eval_fit, ~ trial * stimType * context * numShockRi))

con_index_DIFF <- c_trial_DIFF@levels[["contrast"]] %in% contrasts_of_interest_2

lab_names_pos <- c("ext3,csp,AAAB,1 - tst1,csp,AAAB,1" = "rAAAB",
                   "ext3,csm,AAAB,1 - tst1,csm,AAAB,1" = '',#"reinstatement AAAB",
                   
                   "ext3,csp,AABB,1 - tst1,csp,AABB,1" = "rAABB",
                   "ext3,csm,AABB,1 - tst1,csm,AABB,1" = '',#"reinstatement AABB",
                   
                   "ext3,csp,AABA,1 - tst1,csp,AABA,1" = "rAABA",
                   "ext3,csm,AABA,1 - tst1,csm,AABA,1" = '',#"reinstatement AABA",
                   
                   "ext3,csp,AAAA,1 - tst1,csp,AAAA,1" = "rAAAA",
                   "ext3,csm,AAAA,1 - tst1,csm,AAAA,1" = '',#"reinstatement AABA",
                   
                   "ext3,csp,AAAB,0 - tst1,csp,AAAB,0" = "cAAAB",      
                   "ext3,csm,AAAB,0 - tst1,csm,AAAB,0" = '',#"control AAAB",    
                   
                   "ext3,csp,AABB,0 - tst1,csp,AABB,0" = "cAABB",     
                   "ext3,csm,AABB,0 - tst1,csm,AABB,0" = '',#"control AABB", 
                   
                   "ext3,csp,AABA,0 - tst1,csp,AABA,0" = "cAABA",
                   "ext3,csm,AABA,0 - tst1,csm,AABA,0" = '',#"control AABA" )

                   "ext3,csp,AAAA,0 - tst1,csp,AAAA,0" = "cAAAA",
                   "ext3,csm,AAAA,0 - tst1,csm,AAAA,0" = '')
# convert to dataframe
dat <- data.frame(c_trial_DIFF[con_index_DIFF]) %>%
  droplevels()
# change order of factor levels for plotting
# reinstatement groups first, than control groups
dat$contrast <- factor(dat$contrast, levels = rev(contrasts_of_interest_2))

# add grouping vars
## context
dat[grep('AAAB', dat$contrast), 'context'] <- 'AAAB'
dat[grep('AABB', dat$contrast), 'context'] <- 'AABB'
dat[grep('AABA', dat$contrast), 'context'] <- 'AABA'
dat[grep('AAAA', dat$contrast), 'context'] <- 'AAAA'

dat$context <- factor(dat$context, levels = c('AAAB','AABB','AABA','AAAA'))
## reinstatement / control
dat[grep(',1', dat$contrast), 'ri_group'] <- 'reinstatement'
dat[grep(',0', dat$contrast), 'ri_group'] <- 'control'

## stimulus type
dat[grep('csm', dat$contrast), 'stimType'] <- 'csm'
dat[grep('csp', dat$contrast), 'stimType'] <- 'csp'

dat$stimType <- factor(dat$stimType, levels = c('csp','csm'))

# plot
plotDIFF <- ggplot(dat, aes(x = estimate, y = contrast)) + 
  geom_errorbarh(aes(xmin = lower.HPD, xmax = upper.HPD, 
                     color = context, alpha = ri_group), size = 6, height = 0) +
  scale_alpha_discrete(range = c(0.35, 1)) +
  
  geom_point(data = dat %>% filter(context == 'AAAB' & ri_group == 'reinstatement'),aes(shape = stimType), size = 5, color = 'white') +
  geom_point(aes(shape = stimType),size = 4) +
  geom_vline(xintercept = 0, color = col_zero_line, linetype = type_zero_line, size = size_zero_line) +
  scale_y_discrete(name = paste0('ext vs test in ', out_measure),
                   labels = lab_names_pos) +
  theme_classic() +
  theme(axis.text = element_text(size =16),
        axis.title = element_text(size = 18),
        axis.ticks.y = element_blank(),
        legend.position = 'none') +
  scale_color_manual(values = context_colors)


# add group names to the right
plotDIFF <- plotDIFF + theme(axis.title.y = element_blank(),
                             axis.line.y = element_blank()) +
  scale_y_discrete(labels = lab_names_pos, position = 'right')


# add legend for stimulus type symbols







#windows(width = w, height = h)
plotDIFF

if (save_plot_ind == 1){
  file_nam <- paste0('figures/',out_measure, '_emm_DIFF_wAAAA.tiff')
  ggsave(filename = file_nam, plot = plotDIFF, width = w, height = h, units = 'in')
  
}


