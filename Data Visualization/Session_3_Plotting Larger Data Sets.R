##------------Plotting Larger Data Sets-----------------


# See structure of diamonds data frame




# Plot carat on x and price on y axis; use geom_point
# This is a plot with over 50,000 data points




# Add geom_smooth() after the geom_point() to fit a smooth line, just use a + sign
# Note that + sign simply adds a geometric layer geom_smooth over geom_point
# You can add as many geometric layers as you wish!  





# Show only the smooth line: Remove the geom_point layer




# Map col to clarity in the aes() of ggplot
# Diamonds come in different clarity levels, each having its own pricing methodology
# Can you see which clarity level is the cheapest? 




# Keep the color settings as they are (col mapped to clarity) 
# Plot using geom_point instead of geom_smooth and use alpha = 0.4 inside geom_point
# Alpha is a measure of transparency and is useful to plot large data sets neatly 
# (somewhat neatly)



# Try changing alpha from 0.9 to 0.1 (it's a fraction)




## Visual as Objects:
# dia_plot <- ggplot(diamonds, aes(x = carat, y = price))



# Expand dia_plot by adding geom_point() with alpha set to 0.2
# dia_plot <- dia_plot + geom_point(alpha = 0.2)



