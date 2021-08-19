## RATINGS
if (out_measure == 'ratings'){

# based on pairs(emmeans(model, ~ trial * stimType))
contrasts_man_check_general <- c('acq_3,csp - acq_3,csm', # cs discrimination end acquisition
                                 'ext_3,csp - ext_3,csm', # cs discrimination end extinction
                                 'acq_3,csp - ext_3,csp', # cs+ change acq to ext
                                 'acq_3,csm - ext_3,csm'  # cs- change acq to ext
                                 )

# based on pairs(emmeans(model, ~ trial * stimType * context * numShockRi))
# note that the order in the plot will start at the origin, thus first thing listed here will be at x = 0
contrasts_man_check_groups <- c(
  # AABA, control group
  'acq_3,csm,AABA,0 - ext_3,csm,AABA,0',  # cs- change acq to ext
  'acq_3,csp,AABA,0 - ext_3,csp,AABA,0', # cs+ change acq to ext
  'ext_3,csp,AABA,0 - ext_3,csm,AABA,0', # cs discrimination end extinction
  'acq_3,csp,AABA,0 - acq_3,csm,AABA,0', # cs discrimination end acquisition
  
  # AABB, control group
  'acq_3,csm,AABB,0 - ext_3,csm,AABB,0',  # cs- change acq to ext
  'acq_3,csp,AABB,0 - ext_3,csp,AABB,0', # cs+ change acq to ext
  'ext_3,csp,AABB,0 - ext_3,csm,AABB,0', # cs discrimination end extinction
  'acq_3,csp,AABB,0 - acq_3,csm,AABB,0', # cs discrimination end acquisition
  
  # AAAB, control group
  'acq_3,csm,AAAB,0 - ext_3,csm,AAAB,0',  # cs- change acq to ext
  'acq_3,csp,AAAB,0 - ext_3,csp,AAAB,0', # cs+ change acq to ext
  'ext_3,csp,AAAB,0 - ext_3,csm,AAAB,0', # cs discrimination end extinction
  'acq_3,csp,AAAB,0 - acq_3,csm,AAAB,0', # cs discrimination end acquisition
  
  # AABA, reinstatement group
  'acq_3,csm,AABA,1 - ext_3,csm,AABA,1',  # cs- change acq to ext
  'acq_3,csp,AABA,1 - ext_3,csp,AABA,1', # cs+ change acq to ext
  'ext_3,csp,AABA,1 - ext_3,csm,AABA,1', # cs discrimination end extinction
  'acq_3,csp,AABA,1 - acq_3,csm,AABA,1', # cs discrimination end acquisition
  
  # AABB, reinstatement group
  'acq_3,csm,AABB,1 - ext_3,csm,AABB,1',  # cs- change acq to ext
  'acq_3,csp,AABB,1 - ext_3,csp,AABB,1', # cs+ change acq to ext
  'ext_3,csp,AABB,1 - ext_3,csm,AABB,1', # cs discrimination end extinction
  'acq_3,csp,AABB,1 - acq_3,csm,AABB,1', # cs discrimination end acquisition
  
  # AAAB, reinstatement group
  'acq_3,csm,AAAB,1 - ext_3,csm,AAAB,1',  # cs- change acq to ext
  'acq_3,csp,AAAB,1 - ext_3,csp,AAAB,1', # cs+ change acq to ext
  'ext_3,csp,AAAB,1 - ext_3,csm,AAAB,1', # cs discrimination end extinction
  'acq_3,csp,AAAB,1 - acq_3,csm,AAAB,1' # cs discrimination end acquisition
  
  
)
}


## SCR
if (out_measure == 'scr'){
  
  # based on pairs(emmeans(model, ~ trial * stimType))
  contrasts_man_check_general <- c('acq_9,csp - acq_9,csm', # cs discrimination end acquisition
                                   'ext_9,csp - ext_9,csm', # cs discrimination end extinction
                                   'acq_9,csp - ext_9,csp', # cs+ change acq to ext
                                   'acq_9,csm - ext_9,csm'  # cs- change acq to ext
  )
  
  # based on pairs(emmeans(model, ~ trial * stimType * context * numShockRi))
  # note that the order in the plot will start at the origin, thus first thing listed here will be at x = 0
  contrasts_man_check_groups <- c(
    # AABA, control group
    'acq_9,csm,AABA,0 - ext_9,csm,AABA,0',  # cs- change acq to ext
    'acq_9,csp,AABA,0 - ext_9,csp,AABA,0', # cs+ change acq to ext
    'ext_9,csp,AABA,0 - ext_9,csm,AABA,0', # cs discrimination end extinction
    'acq_9,csp,AABA,0 - acq_9,csm,AABA,0', # cs discrimination end acquisition
    
    # AABB, control group
    'acq_9,csm,AABB,0 - ext_9,csm,AABB,0',  # cs- change acq to ext
    'acq_9,csp,AABB,0 - ext_9,csp,AABB,0', # cs+ change acq to ext
    'ext_9,csp,AABB,0 - ext_9,csm,AABB,0', # cs discrimination end extinction
    'acq_9,csp,AABB,0 - acq_9,csm,AABB,0', # cs discrimination end acquisition
    
    # AAAB, control group
    'acq_9,csm,AAAB,0 - ext_9,csm,AAAB,0',  # cs- change acq to ext
    'acq_9,csp,AAAB,0 - ext_9,csp,AAAB,0', # cs+ change acq to ext
    'ext_9,csp,AAAB,0 - ext_9,csm,AAAB,0', # cs discrimination end extinction
    'acq_9,csp,AAAB,0 - acq_9,csm,AAAB,0', # cs discrimination end acquisition
    
    # AABA, reinstatement group
    'acq_9,csm,AABA,1 - ext_9,csm,AABA,1',  # cs- change acq to ext
    'acq_9,csp,AABA,1 - ext_9,csp,AABA,1', # cs+ change acq to ext
    'ext_9,csp,AABA,1 - ext_9,csm,AABA,1', # cs discrimination end extinction
    'acq_9,csp,AABA,1 - acq_9,csm,AABA,1', # cs discrimination end acquisition
    
    # AABB, reinstatement group
    'acq_9,csm,AABB,1 - ext_9,csm,AABB,1',  # cs- change acq to ext
    'acq_9,csp,AABB,1 - ext_9,csp,AABB,1', # cs+ change acq to ext
    'ext_9,csp,AABB,1 - ext_9,csm,AABB,1', # cs discrimination end extinction
    'acq_9,csp,AABB,1 - acq_9,csm,AABB,1', # cs discrimination end acquisition
    
    # AAAB, reinstatement group
    'acq_9,csm,AAAB,1 - ext_9,csm,AAAB,1',  # cs- change acq to ext
    'acq_9,csp,AAAB,1 - ext_9,csp,AAAB,1', # cs+ change acq to ext
    'ext_9,csp,AAAB,1 - ext_9,csm,AAAB,1', # cs discrimination end extinction
    'acq_9,csp,AAAB,1 - acq_9,csm,AAAB,1' # cs discrimination end acquisition
    
    
  )
}


## SCR
if (out_measure == 'startle'){
  
  # based on pairs(emmeans(model, ~ trial * stimType))
  contrasts_man_check_general <- c('acq_6,csp - acq_6,csm', # cs discrimination end acquisition
                                   'ext_6,csp - ext_6,csm', # cs discrimination end extinction
                                   'acq_6,csp - ext_6,csp', # cs+ change acq to ext
                                   'acq_6,csm - ext_6,csm'  # cs- change acq to ext
  )
  
  # based on pairs(emmeans(model, ~ trial * stimType * context * numShockRi))
  # note that the order in the plot will start at the origin, thus first thing listed here will be at x = 0
  contrasts_man_check_groups <- c(
    # AABA, control group
    'acq_6,csm,AABA,0 - ext_6,csm,AABA,0',  # cs- change acq to ext
    'acq_6,csp,AABA,0 - ext_6,csp,AABA,0', # cs+ change acq to ext
    'ext_6,csp,AABA,0 - ext_6,csm,AABA,0', # cs discrimination end extinction
    'acq_6,csp,AABA,0 - acq_6,csm,AABA,0', # cs discrimination end acquisition
    
    # AABB, control group
    'acq_6,csm,AABB,0 - ext_6,csm,AABB,0',  # cs- change acq to ext
    'acq_6,csp,AABB,0 - ext_6,csp,AABB,0', # cs+ change acq to ext
    'ext_6,csp,AABB,0 - ext_6,csm,AABB,0', # cs discrimination end extinction
    'acq_6,csp,AABB,0 - acq_6,csm,AABB,0', # cs discrimination end acquisition
    
    # AAAB, control group
    'acq_6,csm,AAAB,0 - ext_6,csm,AAAB,0',  # cs- change acq to ext
    'acq_6,csp,AAAB,0 - ext_6,csp,AAAB,0', # cs+ change acq to ext
    'ext_6,csp,AAAB,0 - ext_6,csm,AAAB,0', # cs discrimination end extinction
    'acq_6,csp,AAAB,0 - acq_6,csm,AAAB,0', # cs discrimination end acquisition
    
    # AABA, reinstatement group
    'acq_6,csm,AABA,1 - ext_6,csm,AABA,1',  # cs- change acq to ext
    'acq_6,csp,AABA,1 - ext_6,csp,AABA,1', # cs+ change acq to ext
    'ext_6,csp,AABA,1 - ext_6,csm,AABA,1', # cs discrimination end extinction
    'acq_6,csp,AABA,1 - acq_6,csm,AABA,1', # cs discrimination end acquisition
    
    # AABB, reinstatement group
    'acq_6,csm,AABB,1 - ext_6,csm,AABB,1',  # cs- change acq to ext
    'acq_6,csp,AABB,1 - ext_6,csp,AABB,1', # cs+ change acq to ext
    'ext_6,csp,AABB,1 - ext_6,csm,AABB,1', # cs discrimination end extinction
    'acq_6,csp,AABB,1 - acq_6,csm,AABB,1', # cs discrimination end acquisition
    
    # AAAB, reinstatement group
    'acq_6,csm,AAAB,1 - ext_6,csm,AAAB,1',  # cs- change acq to ext
    'acq_6,csp,AAAB,1 - ext_6,csp,AAAB,1', # cs+ change acq to ext
    'ext_6,csp,AAAB,1 - ext_6,csm,AAAB,1', # cs discrimination end extinction
    'acq_6,csp,AAAB,1 - acq_6,csm,AAAB,1' # cs discrimination end acquisition
    
    
  )
}

