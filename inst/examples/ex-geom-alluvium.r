# basic
ggplot(as.data.frame(Titanic),
       aes(y = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age,
           fill = Survived)) +
  geom_alluvium() +
  scale_x_discrete(limits = c("Class", "Sex", "Age"))

gg <- ggplot(alluvial::Refugees,
             aes(y = refugees, x = year, alluvium = country))
# time series bump chart
gg + geom_alluvium(aes(fill = country, colour = country),
                   width = 1/4, alpha = 2/3, decreasing = FALSE)
# time series line plot of refugees data, sorted by country
gg + geom_alluvium(aes(fill = country, colour = country),
                   decreasing = NA, width = 0, knot.pos = 0)

# irregular spacing between axes of a continuous variable
data(Refugees, package = "alluvial")
refugees_sub <- subset(Refugees, year %in% c(2003, 2005, 2010, 2013))
gg <- ggplot(data = refugees_sub,
             aes(x = year, y = refugees, alluvium = country)) +
  theme_bw() +
  scale_fill_brewer(type = "qual", palette = "Set3")
# proportional knot positioning (default)
gg +
  geom_alluvium(aes(fill = country),
                alpha = .75, decreasing = FALSE) +
  geom_stratum(aes(stratum = country), decreasing = FALSE, width = 1/2)
# fixed knot positioning
gg +
  geom_alluvium(aes(fill = country),
                alpha = .75, decreasing = FALSE,
                knot.pos = 1, knot.fix = TRUE) +
  geom_stratum(aes(stratum = country), decreasing = FALSE, width = 1/2)
