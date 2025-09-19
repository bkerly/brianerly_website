# Let's try this one-step site delpoyer!

deploy_site <- function() {
  # Render site
  quarto::quarto_render()
  
  # Copy files
  unlink("~/bkerly.github.io/*", recursive = TRUE)
  file.copy("_site", "~/bkerly.github.io", recursive = TRUE)
  
  # Push to GitHub Pages
  oldwd <- getwd()
  setwd("~/bkerly.github.io")
  system("git add .")
  system('git commit -m "Update site"')
  system("git push origin main")
  setwd(oldwd)
  
  message("Site deployed!")
}

# Then just run:
deploy_site()