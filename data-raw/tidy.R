#rodar o proj#

devtools::load_all(".")

# passo 1: importar a base bruta #

base_original <- Proj::base_original

#passo 2: arrumar-tidy#

base_arrumada <- base_original

#minha arrumação começa aqui#
# minha 1a opção #
  base_arrumada |>
  dplyr::count(prestação, resultado)

# minha 2a opção #
  base_arrumada |>
    dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
    dplyr::count(resultado)

# então definitivo começa aqui #
  # filtragem por prestação #
  # Procedimento de alta complexidade hospitalar #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(motivo)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar" & motivo == "repartição de competência") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(motivo, fundamento, resultado)

  # Procedimentos não padronizados #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(motivo)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado" & motivo == "inclusão da União por emenda à inicial") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(motivo, fundamento, resultado)

  # Atendimento médico domiciliar ou Home Care #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(motivo)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar" & motivo == "inclusão da União por emenda à inicial") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(motivo, fundamento, resultado)

  # Filtro de exclusão #
base_arrumada |>
  dplyr::count(resultado)

  # Medicamentos #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & motivo == "inclusão da União por emenda à inicial") |>
  dplyr::count(motivo, resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & motivo == "inclusão da União por emenda à inicial") |>
  dplyr::count(orgao_julgador, tipo, resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & motivo == "inclusão da União por emenda à inicial" & tipo == "Acórdão") |>
  dplyr::count(orgao_julgador, resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(motivo, fundamento, resultado) |>
  print(n = 21)



  ggplot (data = base_arrumada) |>
    geom_bar(mapping = aes(x = resultado, y = prestação, color = orgao_julgador))

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
