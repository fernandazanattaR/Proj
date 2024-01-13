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

# então definitivo começa aqui, COM FILTRAGEM POR PRESTAÇÃO #
  # 1 Procedimento de alta complexidade hospitalar #
    # Quantas? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(prestação)
    # Qual a origem dessas ações? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(justiça)
    ### para entender o resultado NA=4 ###
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(justiça, processo) |>
  print(n=156)
    # CONTINUA NORMAL DAQUI #
    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(resultado)
    # Quais os fundamentos e motivos das decisões e seus quantitativos? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(fundamento, motivo)
    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? # #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(fundamento, motivo, orgao_julgador)
    # Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    ###para descobrir o declinada 5.2 proposta contra a U###
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, processo)
    #olha o resultado n13 desse acima, n faz sentido#
    # CONTINUA NORMAL DAQUI #
    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado, fundamento, motivo)
    ### talvez n sejam mais úteis esses resultados ###
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar" & motivo == "repartição de competência") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar") |>
  dplyr::count(motivo, fundamento, resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento de alta complexidade hospitalar" & motivo == "repartição de competência") |>
  dplyr::count(orgao_julgador, resultado)


  # 2 Procedimentos não padronizados #
    # Quantas? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(prestação)
    # Qual a origem dessas ações? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(justiça)
    #para entender o resultado NA=1#
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(justiça, processo) |>
  print(n=61)
    ###resultado n47 n faz sentido###
    # CONTINUA NORMAL DAQUI #
    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(resultado)
    # Quais os fundamentos e motivos das decisões e seus quantitativos? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(motivo)
    ###tem 6 processos com NA no número contabilizados### NA=2#
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(motivo == "NA", processo) |>
  print(n=47)
    # CONTINUA NORMAL DAQUI #
    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? # #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  print(n=24)
    # Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    ### linha 7 oncológico em PNP? verificar planilha ###
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, processo)
    # CONTINUA NORMAL DAQUI #
    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado, fundamento, motivo)
    ### talvez n sejam mais úteis esses resultados ###
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


  # 3 Atendimento médico domiciliar ou Home Care #
    # Quantas? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(prestação)
    # Qual a origem dessas ações? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(justiça)
    ###acabei encontrando 2 resultados sem n do processo###
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(justiça == "NA", processo) |>
  print(n=32)
    # CONTINUA NORMAL DAQUI #
    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(resultado)
    # Quais os fundamentos e motivos das decisões e seus quantitativos? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(motivo)
    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? # #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  print(n=12)
    # Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado, fundamento, motivo)
    ### talvez n sejam mais úteis esses resultados ###
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar" & motivo == "inclusão da União por emenda à inicial") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(motivo, fundamento, resultado)

  # Filtro de exclusão #
base_arrumada |>
  dplyr::count(exclusão)
## os NA são os que foram extraídos dados de conteúdo, objeto de análise##

  # 4 Medicamentos #
    # Quantas? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(prestação)
    # Qual a origem dessas ações? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(justiça)
    ###para entender o resultado NA=16, o q n entendo é 185 sem numero do processo###
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(justiça == "NA", processo) |>
  print(n=1119)
    # CONTINUA NORMAL DAQUI #
    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(resultado)
    # Quais os fundamentos e motivos das decisões e seus quantitativos? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(fundamento, motivo)
    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? ACHO QUE N USAREI ESSE POIS FICOU CONFUSO# #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  print(n=60)
    # Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao) |>
  print(n=127)
    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao) |>
  print(n=97)
    # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao) |>
  print(n=30)
    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado, fundamento, motivo)
### talvez n sejam mais úteis esses resultados ###
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

  # 5 Medicamentos oncológicos #
    # Quantas? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(prestação)
    # Qual a origem dessas ações? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(justiça)
    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(resultado)
    # Quais os fundamentos e motivos das decisões e seus quantitativos, nos casos em que foram mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE" & resultado == "mantida") |>
  dplyr::count(resultado, fundamento, motivo)
    ### para ver esse resultado de duas ações com mantida e inclusão da união no polo passivo por determinação do juízo, estranho###
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE" & resultado == "mantida" & motivo == "inclusão da União no polo passivo por determinação do juízo") |>
  dplyr::count(resultado, fundamento, motivo, processo)
    # CONTINUA NORMAL AQUI #
    # Quais os fundamentos e motivos das decisões e seus quantitativos, nos casos em que foram declinadas?
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE" & resultado == "declinada") |>
  dplyr::count(resultado, fundamento, motivo)
    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? - confuso, provavelmente n usarei # #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  print(n=35)
    # Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao) |>
  print(n=81)
    # CONTINUA NORMAL DAQUI #
    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao) |>
  print(n=89)
    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao) |>
  print(n=159)
    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao) |>
  print(n=59)
   # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado, fundamento, motivo)


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

#
ggplot (data = base_arrumada) |>
    geom_bar(mapping = aes(x = resultado, y = prestação, color = orgao_julgador))
#
ggplot(base_arrumada, aes(Sepal.Length, Sepal.Width, colour = Species)) + geom_point()
# esse abaixo deu certo #
ggplot(base_arrumada, aes(x = justiça)) +
         geom_bar()

# funcionou colorido #
ggplot(base_arrumada, aes(x = orgao_julgador, fill = justiça)) +
  geom_bar(mapping = aes(x = origem))

ggplot(data = base_arrumada) +
  geom_bar(mapping = aes(x = orgao_julgador, fill = justiça), position = "dodge")

ggplot(data = base_arrumada, mapping = aes(x = justiça, fill = orgao_julgador)) +
  geom_bar()
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
