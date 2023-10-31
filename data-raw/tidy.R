#rodar o proj#

devtools::load_all(".")

# passo 1: importar a base bruta #

base_original <- Proj::base_original

#passo 2: arrumar-tidy#

base_arrumada <- base_original

#minha arrumação começa aqui#

#  dyplr::

#passo 3: salvar base arrumada#

usethis::use_data(base_arrumada,overwrite = TRUE)
