### RATINGS
if(out_measure == 'ratings'){
# trial x context x numShockRi
contrasts_of_interest_1 <- c('ext3,AAAB,1 - tst1,AAAB,1',
                           'ext3,AABB,1 - tst1,AABB,1',
                           'ext3,AABA,1 - tst1,AABA,1',
                           'ext3,AAAA,1 - tst1,AAAA,1',
                           'ext3,AAAB,0 - tst1,AAAB,0',
                           'ext3,AABB,0 - tst1,AABB,0',
                           'ext3,AABA,0 - tst1,AABA,0',
                           'ext3,AAAA,0 - tst1,AAAA,0'
                           )


# trial x stimType x context x numShockRi
contrasts_of_interest_2 <- c('ext3,csp,AAAB,1 - tst1,csp,AAAB,1',
                             'ext3,csm,AAAB,1 - tst1,csm,AAAB,1',
                             
                             'ext3,csp,AABB,1 - tst1,csp,AABB,1',
                             'ext3,csm,AABB,1 - tst1,csm,AABB,1',
                             
                             'ext3,csp,AABA,1 - tst1,csp,AABA,1',
                             'ext3,csm,AABA,1 - tst1,csm,AABA,1',
                             
                             'ext3,csp,AAAA,1 - tst1,csp,AAAA,1',
                             'ext3,csm,AAAA,1 - tst1,csm,AAAA,1',
                             
                             'ext3,csp,AAAB,0 - tst1,csp,AAAB,0',
                             'ext3,csm,AAAB,0 - tst1,csm,AAAB,0',
                             
                             'ext3,csp,AABB,0 - tst1,csp,AABB,0',
                             'ext3,csm,AABB,0 - tst1,csm,AABB,0',
                             
                             'ext3,csp,AABA,0 - tst1,csp,AABA,0',
                             'ext3,csm,AABA,0 - tst1,csm,AABA,0',
                             
                             'ext3,csp,AAAA,0 - tst1,csp,AAAA,0',
                             'ext3,csm,AAAA,0 - tst1,csm,AAAA,0')

#con_index_2 <- c_trial_stimType_group_3@levels[["contrast"]] %in% contrasts_of_interest_2
#plot(c_trial_stimType_group_3[con_index_2] )


# CS discrimination within trial in phase for context x numShockRi
contrasts_of_interest_3 <- c('ext3,csp,AAAB,1 - ext3,csm,AAAB,1',
                           'ext3,csp,AABB,1 - ext3,csm,AABB,1',
                           'ext3,csp,AABA,1 - ext3,csm,AABA,1',
                           'ext3,csp,AAAA,1 - ext3,csm,AAAA,1',
                           
                           'tst1,csp,AAAB,1 - tst1,csm,AAAB,1',
                           'tst1,csp,AABB,1 - tst1,csm,AABB,1',
                           'tst1,csp,AABA,1 - tst1,csm,AABA,1',
                           'tst1,csp,AAAA,1 - tst1,csm,AAAA,1',
                           
                           'ext3,csp,AAAB,0 - ext3,csm,AAAB,0',
                           'ext3,csp,AABB,0 - ext3,csm,AABB,0',
                           'ext3,csp,AABA,0 - ext3,csm,AABA,0',
                           'ext3,csp,AAAA,0 - ext3,csm,AAAA,0',
                           
                           'tst1,csp,AAAB,0 - tst1,csm,AAAB,0',
                           'tst1,csp,AABB,0 - tst1,csm,AABB,0',
                           'tst1,csp,AABA,0 - tst1,csm,AABA,0',
                           'tst1,csp,AAAA,0 - tst1,csm,AAAA,0')

#con_index_3 <- c_trial_stimType_group_3@levels[["contrast"]] %in% contrasts_of_interest_3
#plot(c_trial_stimType_group_3[con_index_3] )
}

### STARTLE
# trial x context x numShockRi
if( out_measure == 'startle'){
contrasts_of_interest_1 <- c('ext6,AAAB,1 - tst1,AAAB,1',
                             'ext6,AABB,1 - tst1,AABB,1',
                             'ext6,AABA,1 - tst1,AABA,1',
                             'ext6,AAAA,1 - tst1,AAAA,1',
                             'ext6,AAAB,0 - tst1,AAAB,0',
                             'ext6,AABB,0 - tst1,AABB,0',
                             'ext6,AABA,0 - tst1,AABA,0',
                             'ext6,AAAA,0 - tst1,AAAA,0')

#con_index <- c_trial_group_3@levels[["contrast"]] %in% contrasts_of_interest_1
#plot(c_trial_group_3[con_index] )


# trial x stimType x context x numShockRi
contrasts_of_interest_2 <- c('ext6,csp,AAAB,1 - tst1,csp,AAAB,1',
                             'ext6,csm,AAAB,1 - tst1,csm,AAAB,1',
                             'ext6,iti,AAAB,1 - tst1,iti,AAAB,1',
                             
                             'ext6,csp,AABB,1 - tst1,csp,AABB,1',
                             'ext6,csm,AABB,1 - tst1,csm,AABB,1',
                             'ext6,iti,AABB,1 - tst1,iti,AABB,1',
                             
                             'ext6,csp,AABA,1 - tst1,csp,AABA,1',
                             'ext6,csm,AABA,1 - tst1,csm,AABA,1',     
                             'ext6,iti,AABA,1 - tst1,iti,AABA,1',
                             
                             'ext6,csp,AAAA,1 - tst1,csp,AAAA,1',
                             'ext6,csm,AAAA,1 - tst1,csm,AAAA,1',     
                             'ext6,iti,AAAA,1 - tst1,iti,AAAA,1',
                             
                             
                             'ext6,csp,AAAB,0 - tst1,csp,AAAB,0',
                             'ext6,csm,AAAB,0 - tst1,csm,AAAB,0',
                             'ext6,iti,AAAB,0 - tst1,iti,AAAB,0',
                             
                             'ext6,csp,AABB,0 - tst1,csp,AABB,0',
                             'ext6,csm,AABB,0 - tst1,csm,AABB,0',
                             'ext6,iti,AABB,0 - tst1,iti,AABB,0',
                             
                             'ext6,csp,AABA,0 - tst1,csp,AABA,0',
                             'ext6,csm,AABA,0 - tst1,csm,AABA,0',
                             'ext6,iti,AABA,0 - tst1,iti,AABA,0',
                             
                             'ext6,csp,AAAA,0 - tst1,csp,AAAA,0',
                             'ext6,csm,AAAA,0 - tst1,csm,AAAA,0',
                             'ext6,iti,AAAA,0 - tst1,iti,AAAA,0')


# CS discrimination within trial in phase for context x numShockRi
contrasts_of_interest_3 <- c('ext6,csp,AAAB,1 - ext6,csm,AAAB,1',
                             'ext6,csp,AABB,1 - ext6,csm,AABB,1',
                             'ext6,csp,AABA,1 - ext6,csm,AABA,1',
                             'ext6,csp,AAAA,1 - ext6,csm,AAAA,1',
                             
                             'tst1,csp,AAAB,1 - tst1,csm,AAAB,1',
                             'tst1,csp,AABB,1 - tst1,csm,AABB,1',
                             'tst1,csp,AABA,1 - tst1,csm,AABA,1',
                             'tst1,csp,AAAA,1 - tst1,csm,AAAA,1',
                             
                             'ext6,csp,AAAB,0 - ext6,csm,AAAB,0',
                             'ext6,csp,AABB,0 - ext6,csm,AABB,0',
                             'ext6,csp,AABA,0 - ext6,csm,AABA,0',
                             'ext6,csp,AAAA,0 - ext6,csm,AAAA,0',
                             
                             'tst1,csp,AAAB,0 - tst1,csm,AAAB,0',
                             'tst1,csp,AABB,0 - tst1,csm,AABB,0',
                             'tst1,csp,AABA,0 - tst1,csm,AABA,0',
                             'tst1,csp,AAAA,0 - tst1,csm,AAAA,0')

#con_index_3 <- c_trial_stimType_group_3@levels[["contrast"]] %in% contrasts_of_interest_3
#plot(c_trial_stimType_group_3[con_index_3] )
}

### SCR
if(out_measure == 'scr'){
  # trial x context x numShockRi
  contrasts_of_interest_1 <- c('ext9,AAAB,1 - tst1,AAAB,1',
                               'ext9,AABB,1 - tst1,AABB,1',
                               'ext9,AABA,1 - tst1,AABA,1',
                               'ext9,AAAA,1 - tst1,AAAA,1',
                               'ext9,AAAB,0 - tst1,AAAB,0',
                               'ext9,AABB,0 - tst1,AABB,0',
                               'ext9,AABA,0 - tst1,AABA,0',
                               'ext9,AAAA,0 - tst1,AAAA,0')
  
  #con_index <- c_trial_group_3@levels[["contrast"]] %in% contrasts_of_interest_1
  #plot(c_trial_group_3[con_index] )
  
  
  # trial x stimType x context x numShockRi
  # contrasts_of_interest_2 <- c('ext9,csm,AAAB,1 - tst1,csm,AAAB,1',
  #                              'ext9,csm,AABB,1 - tst1,csm,AABB,1',
  #                              'ext9,csm,AABA,1 - tst1,csm,AABA,1',
  #                              
  #                              'ext9,csp,AAAB,1 - tst1,csp,AAAB,1',
  #                              'ext9,csp,AABB,1 - tst1,csp,AABB,1',
  #                              'ext9,csp,AABA,1 - tst1,csp,AABA,1',
  #                              
  #                              'ext9,csm,AAAB,0 - tst1,csm,AAAB,0',
  #                              'ext9,csm,AABB,0 - tst1,csm,AABB,0',
  #                              'ext9,csm,AABA,0 - tst1,csm,AABA,0',
  #                              
  #                              'ext9,csp,AAAB,0 - tst1,csp,AAAB,0',
  #                              'ext9,csp,AABB,0 - tst1,csp,AABB,0',
  #                              'ext9,csp,AABA,0 - tst1,csp,AABA,0')
  
  contrasts_of_interest_2 <- c('ext9,csp,AAAB,1 - tst1,csp,AAAB,1',
                               'ext9,csm,AAAB,1 - tst1,csm,AAAB,1',
                               
                               'ext9,csp,AABB,1 - tst1,csp,AABB,1',
                               'ext9,csm,AABB,1 - tst1,csm,AABB,1',
                               
                               'ext9,csp,AABA,1 - tst1,csp,AABA,1',
                               'ext9,csm,AABA,1 - tst1,csm,AABA,1',
                               
                               'ext9,csp,AAAA,1 - tst1,csp,AAAA,1',
                               'ext9,csm,AAAA,1 - tst1,csm,AAAA,1',
                               
                               'ext9,csp,AAAB,0 - tst1,csp,AAAB,0',
                               'ext9,csm,AAAB,0 - tst1,csm,AAAB,0',
                               
                               'ext9,csp,AABB,0 - tst1,csp,AABB,0',
                               'ext9,csm,AABB,0 - tst1,csm,AABB,0',
                               
                               'ext9,csp,AABA,0 - tst1,csp,AABA,0',
                               'ext9,csm,AABA,0 - tst1,csm,AABA,0',
                               
                               'ext9,csp,AAAA,0 - tst1,csp,AAAA,0',
                               'ext9,csm,AAAA,0 - tst1,csm,AAAA,0')
  
  
  #con_index_2 <- c_trial_stimType_group_3@levels[["contrast"]] %in% contrasts_of_interest_2
  #plot(c_trial_stimType_group_3[con_index_2] )
  
  
  # CS discrimination within trial in phase for context x numShockRi
  contrasts_of_interest_3 <- c('ext9,csp,AAAB,1 - ext9,csm,AAAB,1',
                               'ext9,csp,AABB,1 - ext9,csm,AABB,1',
                               'ext9,csp,AABA,1 - ext9,csm,AABA,1',
                               'ext9,csp,AAAA,1 - ext9,csm,AAAA,1',
                               
                               'tst1,csp,AAAB,1 - tst1,csm,AAAB,1',
                               'tst1,csp,AABB,1 - tst1,csm,AABB,1',
                               'tst1,csp,AABA,1 - tst1,csm,AABA,1',
                               'tst1,csp,AAAA,1 - tst1,csm,AAAA,1',
                               
                               'ext9,csp,AAAB,0 - ext9,csm,AAAB,0',
                               'ext9,csp,AABB,0 - ext9,csm,AABB,0',
                               'ext9,csp,AABA,0 - ext9,csm,AABA,0',
                               'ext9,csp,AAAA,0 - ext9,csm,AAAA,0',
                               
                               'tst1,csp,AAAB,0 - tst1,csm,AAAB,0',
                               'tst1,csp,AABB,0 - tst1,csm,AABB,0',
                               'tst1,csp,AABA,0 - tst1,csm,AABA,0',
                               'tst1,csp,AAAA,0 - tst1,csm,AAAA,0')
  
  #con_index_3 <- c_trial_stimType_group_3@levels[["contrast"]] %in% contrasts_of_interest_3
  #plot(c_trial_stimType_group_3[con_index_3] )
}




### startle CSs only
### STARTLE
# trial x context x numShockRi
if( out_measure == 'startle (CSs)'){
  contrasts_of_interest_1 <- c('ext6,AAAB,1 - tst1,AAAB,1',
                               'ext6,AABB,1 - tst1,AABB,1',
                               'ext6,AABA,1 - tst1,AABA,1',
                               'ext6,AAAA,1 - tst1,AAAA,1',
                               'ext6,AAAB,0 - tst1,AAAB,0',
                               'ext6,AABB,0 - tst1,AABB,0',
                               'ext6,AABA,0 - tst1,AABA,0',
                               'ext6,AAAA,0 - tst1,AAAA,0')
  
  #con_index <- c_trial_group_3@levels[["contrast"]] %in% contrasts_of_interest_1
  #plot(c_trial_group_3[con_index] )
  
  
  # trial x stimType x context x numShockRi
  contrasts_of_interest_2 <- c('ext6,csp,AAAB,1 - tst1,csp,AAAB,1',
                               'ext6,csm,AAAB,1 - tst1,csm,AAAB,1',
                               
                               'ext6,csp,AABB,1 - tst1,csp,AABB,1',
                               'ext6,csm,AABB,1 - tst1,csm,AABB,1',
                               
                               'ext6,csp,AABA,1 - tst1,csp,AABA,1',
                               'ext6,csm,AABA,1 - tst1,csm,AABA,1', 
                               
                               'ext6,csp,AAAA,1 - tst1,csp,AAAA,1',
                               'ext6,csm,AAAA,1 - tst1,csm,AAAA,1', 
                              
                               'ext6,csp,AAAB,0 - tst1,csp,AAAB,0',
                               'ext6,csm,AAAB,0 - tst1,csm,AAAB,0',
                               
                               'ext6,csp,AABB,0 - tst1,csp,AABB,0',
                               'ext6,csm,AABB,0 - tst1,csm,AABB,0',
                               
                               'ext6,csp,AABA,0 - tst1,csp,AABA,0',
                               'ext6,csm,AABA,0 - tst1,csm,AABA,0',
                               
                               'ext6,csp,AAAA,0 - tst1,csp,AAAA,0',
                               'ext6,csm,AAAA,0 - tst1,csm,AAAA,0'
                               )
  
  
  # CS discrimination within trial in phase for context x numShockRi
  contrasts_of_interest_3 <- c('ext6,csp,AAAB,1 - ext6,csm,AAAB,1',
                               'ext6,csp,AABB,1 - ext6,csm,AABB,1',
                               'ext6,csp,AABA,1 - ext6,csm,AABA,1',
                               'ext6,csp,AAAA,1 - ext6,csm,AAAA,1',
                               
                               'tst1,csp,AAAB,1 - tst1,csm,AAAB,1',
                               'tst1,csp,AABB,1 - tst1,csm,AABB,1',
                               'tst1,csp,AABA,1 - tst1,csm,AABA,1',
                               'tst1,csp,AAAA,1 - tst1,csm,AAAA,1',
                               
                               'ext6,csp,AAAB,0 - ext6,csm,AAAB,0',
                               'ext6,csp,AABB,0 - ext6,csm,AABB,0',
                               'ext6,csp,AABA,0 - ext6,csm,AABA,0',
                               'ext6,csp,AAAA,0 - ext6,csm,AAAA,0',
                               
                               'tst1,csp,AAAB,0 - tst1,csm,AAAB,0',
                               'tst1,csp,AABB,0 - tst1,csm,AABB,0',
                               'tst1,csp,AABA,0 - tst1,csm,AABA,0',
                               'tst1,csp,AAAA,0 - tst1,csm,AAAA,0')
  
  #con_index_3 <- c_trial_stimType_group_3@levels[["contrast"]] %in% contrasts_of_interest_3
  #plot(c_trial_stimType_group_3[con_index_3] )
}
