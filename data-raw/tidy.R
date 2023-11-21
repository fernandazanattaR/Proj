#rodar o proj#

devtools::load_all(".")

# passo 1: importar a base bruta #

base_original <- Proj::base_original

#passo 2: arrumar-tidy#

base_arrumada <- base_original

#minha arrumação começa aqui#

  dplyr::group_by(base_arrumada, prestação)
  dplyr::count(base_arrumada, prestação == "procedimento de alta complexidade hospitalar", resultado)
  -
  dplyr::arrange(
    prestação
  )
------
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
      (resultado == "declinada" & fundamento == "5.1" & motivo == "repartição de competência") ~ "Declianda por Repartição de Competência",
      (resultado == "mantida" & fundamento == "5.1" & motivo == "repartição de competência") ~ "Mantida por Repartição de Competência",
      (resultado == "mantida" & fundamento == "5.1" & motivo == "compete à União o ressarcimento administrativo") ~ "Compete à União o ressarcimento administrativo",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa",
      (fundamento == "5.1" & motivo == "XXXX") ~ "Outra coisa"
    )
  )

#  dyplr::

#passo 3: salvar base arrumada#

usethis::use_data(base_arrumada,overwrite = TRUE)
