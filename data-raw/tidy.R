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
  dplyr::count(justiça)
    #para entender o resultado NA=10#
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(justiça == "NA", processo) |>
  print(n=154)
  # CONTINUA NORMAL DAQUI #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar" & motivo == "repartição de competência") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(motivo, fundamento, resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar" & motivo == "repartição de competência") |>
  dplyr::count(orgao_julgador, resultado)

  # Procedimentos não padronizados #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(justiça)
    #para entender o resultado NA=4#
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(justiça == "NA", processo) |>
  print(n=47)
# CONTINUA NORMAL DAQUI #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(motivo)
    #para entender o resultado NA=2#
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(motivo == "NA", processo) |>
  print(n=47)
# CONTINUA NORMAL DAQUI #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado" & motivo == "inclusão da União por emenda à inicial") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(motivo, fundamento, resultado)
    #para entender o resultado NA=2#
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(motivo == "NA", processo) |>
  print(n=47)

  # Atendimento médico domiciliar ou Home Care #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(justiça)
    #para entender o resultado NA=2#
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(justiça == "NA", processo) |>
  print(n=32)
# CONTINUA NORMAL DAQUI #
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
  dplyr::count(exclusão)
## VER COMO EXCLUIR NESSE CASO OS NA PQ N INTERESSA##

  # Medicamentos #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(justiça)
#para entender o resultado NA=34#
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(justiça == "NA", processo) |>
  print(n=1119)
# CONTINUA NORMAL DAQUI #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(motivo)
#para entender o resultado NA=60#
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(motivo == "NA", processo) |>
  print(n=1126)
# CONTINUA NORMAL DAQUI #
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
  dplyr::filter(prestação == "medicamento" & motivo == "inclusão da União no polo passivo por determinação do juízo") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & motivo == "inclusão da União no polo passivo por determinação do juízo" & resultado == "mantida") |>
  dplyr::count(orgao_julgador, resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & motivo == "segurança jurídica") |>
  dplyr::count(orgao_julgador, resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & motivo == "segurança jurídica") |>
  dplyr::count(orgao_julgador, tipo, resultado)
#
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & motivo == "segurança jurídica") |>
  dplyr::count(orgao_julgador, tipo, resultado, processo)
#
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & motivo == "vedação de declinação da competência") |>
  dplyr::count(orgao_julgador, resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & motivo == "vedação de declinação da competência") |>
  dplyr::count(orgao_julgador, tipo, resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & fundamento == "tema 1234 visa evitar deslocamentos") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & fundamento == "tema 1234 visa evitar deslocamentos") |>
  dplyr::count(orgao_julgador, tipo, resultado, data_da_decisao)

# medicamento total #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(motivo, fundamento, resultado) |>
  print(n = 26)

# ˆˆtentar entender o que aconteceu nas linhas 13/26 da última análise #

# Aqui começa a análise dos oncológicos #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(justiça)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE" & resultado == "mantida") |>
  dplyr::count(resultado, fundamento, motivo)
##no resultado do de cima verificar 1) ressarc//adm, 2) grupo 1a, 3) por det do juízo##
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE" & resultado == "declinada") |>
  dplyr::count(resultado, fundamento, motivo)
##no resultado do de cima verificar os 22 casos NA##
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(motivo, resultado, fundamento)
###add orgao_julgador###

##apenas usada para teste, não vai ficar##
base_arrumada |>
  dplyr::filter(fundamento == "tema 1234 visa evitar deslocamentos") |>
  dplyr::count(fundamento, resultado, motivo)

## me faz achar que os resultados estão saindo duplicados ##
base_arrumada |>
  dplyr::count(fundamento)
base_arrumada |>
  dplyr::count(processo)

base_arrumada |>
  dplyr::filter(motivo == "sentenciado") |>
  dplyr::count(motivo, fundamento, resultado, processo) |>
  print(n = 244)

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
