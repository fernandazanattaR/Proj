# 1.2 pré-requisitos

install.packages(c("usethis", "renv", "tidyverse")) 
install.packages("devtools")

# 3 Caminhos relativos e absolutos

R.utils::getRelativePath(getwd())
#> [1] "."

# 3.2 Organizando o ambiente

usethis::create_project("/Users/macmini/Documents/Jurimetria/R/Proj/")
#> ✔ Creating '~/Users/macmini/Documents/Jurimetria/R/Proj/'
#> ✔ Setting active project to '~/Users/macmini/Documents/Jurimetria/R/Proj'
#> ✔ Creating 'R/'
#> ✔ Writing 'Proj.Rproj'
#> ✔ Adding '.Rproj.user' to '.gitignore'
#> ✔ Opening '~/Users/macmini/Documents/Jurimetria/R/Proj/' in new RStudio session
#> ✔ Setting active project to 'Proj'

usethis::create_github_token()
#> ● Call `gitcreds::gitcreds_set()` to register this token in the local Git credential store
#>   It is also a great idea to store this token in any password-management software that you use
#> ✔ Opening URL 'https://github.com/settings/tokens/new?scopes=repo,user,gist,workflow&description=R:GITHUB_PAT'
#> gitcreds::gitcreds_set()
#> 
#> usethis::create_project("~/Documents/demo")
#> ✔ Creating '~/Documents/demo/'
#> ✔ Setting active project to '~/Documents/demo'
#> ✔ Creating 'R/'
#> ✔ Writing 'demo.Rproj'
#> ✔ Adding '.Rproj.user' to '.gitignore'
#> ✔ Opening '~/Documents/demo/' in new RStudio session
#> ✔ Setting active project to 'demo' 

# No console do novo projeto

usethis::use_git()
#> ✔ Setting active project to '~/Documents/demo'
#> ✔ Initialising Git repo
#> ✔ Adding '.Rhistory', '.RData' to '.gitignore'
#> There are 2 uncommitted files:
#> * '.gitignore'
#> * 'demo.Rproj'
#> Is it ok to commit them?
#> 
#> 1: Negative
#> 2: Not now
#> 3: I agree
#> 
#> Selection: 3
#> ✔ Adding files
#> ✔ Commit with message 'Initial commit'
#> ● A restart of RStudio is required to activate the Git pane
#> Restart now?
#> 
#> 1: Absolutely not
#> 2: No way
#> 3: Yes
#> 
#> Selection: 3

usethis::use_github()
#> ✔ Checking that current branch is 'master'
#> Which git protocol to use? (enter 0 to exit) 
#> 
#> 1: ssh   <-- presumes that you have set up ssh keys
#> 2: https <-- choose this if you don't have ssh keys (or don't know if you do)
#> 
#> Selection: 2
#> ● Check title and description
#>   Name:        demo
#>   Description: 
#> Are title and description ok?
#> 
#> 1: Nope
#> 2: No way
#> 3: Yup
#> 
#> Selection: 3
#> ✔ Creating GitHub repository
#> ✔ Setting remote 'origin' to 'https://github.com/curso-r/demo.git'
#> ✔ Pushing 'master' branch to GitHub and setting remote tracking branch
#> ✔ Opening URL 'https://github.com/curso-r/demo'
