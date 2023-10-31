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

# add o token
gitcreds::gitcreds_set()

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

############################## fim até capítulo 4####

library(dplyr)
library(tidyverse)
tidyverse_update()
library(tidyverse)

ggplot2::mpg

#template gráfico geral#
ggplot(data = <DATA>) +
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

#template gráfico customizado#
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

#importar planilha#
library(readr)
planilha910 <- read_csv("planilha910.csv")
View(planilha910)

#planilha nessa forma só se tiver poucas opções#
ggplot(data = planilha) +
  geom_bar(mapping = aes(x = resultado))

#bem interessante esse tipo de planilha#
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

# data transformation #
# Para selecionar colunas usar select()
select()

# tidy
base_arrumada <- base_suja |>
  dplyr::mutate(
    resultado = dplyr::if_else(
      condition = (fundamento == "5.2" & motivo == "inclusão da União de ofício" & oncologico),
      true = "Turma diferencia os casos em que o oncológico está padronizado",
      false = NA_character_
    ),
    resultado = dplyr::if_else(
      condition = (fundamento == "5.2" & motivo == "inclusão da União de ofício" & !oncologico),
      true = "Turma não faz diferença entre os casos em que o oncológico está padronizado",
      false = NA_character_
    ),
    resultado = dplyr::case_when(
      (fundamento == "5.2" & motivo == "inclusão da União de ofício" & oncologico) ~ "Turma diferencia os casos em que o oncológico está padronizado",
      (fundamento == "5.2" & motivo == "inclusão da União de ofício" & !oncologico) ~ "Turma não faz diferença entre os casos em que o oncológico está padronizado",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa"
    )
  )

# para alteração da forma da data para dmy #

planilha910 |>
  dplyr::mutate(data_da_decisao=lubridate::dmy(data_da_decisao))

usethis::



