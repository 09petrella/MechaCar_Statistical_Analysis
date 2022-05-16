library(dplyr)
mechacar <- read.csv('MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar))

suspension_coil <- read.csv('Suspension_Coil.csv', check.names = F, stringsAsFactors = F)
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

sample_all_coils <- suspension_coil %>% sample_n(50)
t.test(sample_all_coils$PSI, mu=mean(suspension_coil$PSI))

Lot1 = subset(suspension_coil, Manufacturing_Lot == "Lot1")
t.test(Lot1$PSI, mu=mean(suspension_coil$PSI))

Lot2 = subset(suspension_coil, Manufacturing_Lot == "Lot2")
t.test(Lot2$PSI, mu=mean(suspension_coil$PSI))

Lot3 = subset(suspension_coil, Manufacturing_Lot == "Lot3")
t.test(Lot3$PSI, mu=mean(suspension_coil$PSI))