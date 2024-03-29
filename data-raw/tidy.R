#rodar o proj#

devtools::load_all(".")

# passo 1: importar a base bruta #

base_original <- Proj::base_original

#passo 2: arrumar-tidy#

base_arrumada <- base_original

# 5.1 Quantitativo de decisões analisadas #
#totalidade de ocorrências#
base_arrumada |>
  dplyr::count()

#do total x tiveram análise da competência#
base_arrumada |>
  dplyr::filter(exclusão == "matéria diversa" | exclusão == "não analisou" | exclusão == "situação anterior" | exclusão == "sobrestou" | exclusão == "indisponível para consulta") |>
  dplyr::count(exclusão) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = exclusão, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Motivo da ausência de análise", title = "Sem análise da competência") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle=25, hjust=1)) +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

#dos que tiveram análise de competência - a origem #
base_arrumada |>
  dplyr::filter(exclusão == "não") |>
  dplyr::count(justiça)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = justiça, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Origem", title = "Origem das demandas") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

#quantos foram declinadas e quantas foram mantidas#
base_arrumada |>
  dplyr::filter(exclusão == "não") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Análise da competência") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

# 1 Procedimento padronizado #
    # Quantas? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado") |>
  dplyr::count(prestação)
    # Qual a origem dessas ações? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado") |>
  dplyr::count(justiça) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = justiça, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Origem", title = "Procedimento padronizado") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
          position=ggplot2::position_dodge2(width=0.80)
  )

    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado") |>
  dplyr::count(resultado) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
          position=ggplot2::position_dodge2(width=0.80)
  )

    # Quais os fundamentos e motivos das decisões e seus quantitativos? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado") |>
  dplyr::count(resultado, fundamento, motivo) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n, fill = motivo) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? # #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  print(n=21)

    # Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 5ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 5ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao)

  #n sei se compensa fazer só de acórdão como ABAIXO#

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "QUINTA TURMA", tipo =="Acórdão") |>
  dplyr::count(resultado, fundamento, motivo) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Procedimento padronizado - 5ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )
    #n sei se compensa fazer só de acórdão como acima#

    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 6ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 6ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao) |>
  print(n=24)

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "SEXTA TURMA", tipo =="Acórdão") |>
  dplyr::count(resultado, fundamento, motivo)

    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Procedimento padronizado - 9ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 9ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao)

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "NONA TURMA", tipo =="Acórdão") |>
  dplyr::count(resultado, fundamento, motivo)

    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 10ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 10ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao)

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "DÉCIMA TURMA", tipo =="Acórdão") |>
  dplyr::count(resultado, fundamento, motivo)

# Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "DÉCIMA PRIMEIRA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 10ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao)

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "DÉCIMA TURMA", tipo =="Acórdão") |>
  dplyr::count(resultado, fundamento, motivo)

    # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Procedimento padronizado - 1ª TRPR") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 1ª TRPR") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado)

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)

    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Procedimento padronizado - 5ª TRRS") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento padronizado - 5ª TRRS") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    ### talvez n sejam mais úteis esses resultados ###
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado" & motivo == "repartição de competência") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado") |>
  dplyr::count(motivo, fundamento, resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento padronizado" & motivo == "repartição de competência") |>
  dplyr::count(orgao_julgador, resultado)


  # 2 Procedimentos não padronizados #
    # Quantas? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(prestação)
    # Qual a origem dessas ações? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(justiça) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = justiça, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Justiça", title = "Procedimento não padronizado") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

    #para entender o resultado NA=1#
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(justiça, processo) |>
  print(n=61)
    ###resultado n35,47 n faz sentido###
    # CONTINUA NORMAL DAQUI #
    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento não padronizado") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quais os fundamentos e motivos das decisões e seus quantitativos? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n, fill = motivo) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Procedimento não padronizado") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? # #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  print(n=24)

    # Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Procedimento não padronizado - 5ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento não padronizado - 5ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "QUINTA TURMA", tipo =="Acórdão") |>
  dplyr::count(resultado, fundamento, motivo)

    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento não padronizado - 6ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento não padronizado - 6ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "SEXTA TURMA", tipo == "Acórdão") |>
  dplyr::count(resultado, fundamento, motivo, tipo)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao)
    ### linha 7 oncológico em PNP? verificar planilha ###
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, processo)
    # CONTINUA NORMAL DAQUI #
    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado",  title = "Procedimento não padronizado - 9ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento não padronizado - 9ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "NONA TURMA", tipo == "Acórdão") |>
  dplyr::count(resultado, fundamento, motivo)

    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Procedimento não padronizado - 10ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento não padronizado - 10ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Procedimento não padronizado - 1ª TRPR") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento não padronizado - 1ª TRPR") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 3, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Procedimento não padronizado - 5ª TRRS") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "procedimento não padronizado", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Procedimento não padronizado - 5ª TRRS") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

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
  dplyr::count(justiça)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = justiça, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Atendimento médico domiciliar") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(resultado) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Atendimento médico domiciliar") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quais os fundamentos e motivos das decisões e seus quantitativos? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n, fill = motivo) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Atendimento médico domiciliar") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? # #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  print(n=12)
    # Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Atendimento médico domiciliar - 5ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Atendimento médico domiciliar - 5ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "QUINTA TURMA", tipo == "Acórdão") |>
  dplyr::count(resultado, fundamento, motivo)

    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Atendimento médico domiciliar - 6ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Atendimento médico domiciliar - 6ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "SEXTA TURMA", tipo == "Acórdão") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Atendimento médico domiciliar - 9ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao)
    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar", orgao_julgador == "QUINTA TURMNA RECURSAL") |>
  dplyr::count(resultado, fundamento, motivo, tipo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Atendimento médico domiciliar - 5ª TRRS") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    ### talvez n sejam mais úteis esses resultados ###
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar" & motivo == "inclusão da União por emenda à inicial") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "atendimento médico domiciliar") |>
  dplyr::count(motivo, fundamento, resultado)

  # Filtro de exclusão #
base_arrumada |>
  dplyr::count(exclusão)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = exclusão, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Sem análise de competência") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle=45, hjust=1)) +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )
## os NA são os que foram extraídos dados de conteúdo, objeto de análise##

  # 4 Medicamentos - Geral#
    # Quantas? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(prestação)
    # Qual a origem dessas ações? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento") |>
  dplyr::count(justiça)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = justiça, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Justiça", title = "Medicamentos") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

  # 4.1 Medicamentos Não oncológicos #
    #Quantas?#
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE") |>
  dplyr::count(prestação)
# Qual a origem dessas ações? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE") |>
  dplyr::count(justiça)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = justiça, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Justiça", title = "Medicamentos") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )
    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Medicamento não oncológico") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quais os fundamentos e motivos das decisões e seus quantitativos? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n, fill = motivo) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Medicamento não oncológico") +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? ACHO QUE N USAREI ESSE POIS FICOU CONFUSO# #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  print(n=55)
    # Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Medicamento não oncológico - 5ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 5ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento"  & oncológico == "FALSE", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao) |>
  print(n=71)
    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 6ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 6ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 9ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 9ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "NONA TURMA", tipo == "Acórdão") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao) |>
  print(n=39)
    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 10ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 10ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento"  & oncológico == "FALSE", orgao_julgador == "DÉCIMA TURMA", tipo == "Acórdão") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao) |>
  print(n=56)
    # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 1ª TRPR") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 1ª TRPR") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo, data_da_decisao) |>
  print(n=27)
    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento"  & oncológico == "FALSE", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 3ª TRSC") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "FALSE", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado)|>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 5ª TRRS") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento"  & oncológico == "FALSE", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento não oncológico - 5ª TRRS") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

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
  dplyr::count(justiça)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = justiça, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quantas declinadas e quantas mantidas? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Quais os fundamentos e motivos das decisões e seus quantitativos #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    ### para ver esse resultado de duas ações com mantida e inclusão da união no polo passivo por determinação do juízo, estranho###
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE" & resultado == "mantida" & motivo == "inclusão da União no polo passivo por determinação do juízo") |>
  dplyr::count(resultado, fundamento, motivo, processo)
    # CONTINUA NORMAL AQUI #
    # Quais os fundamentos e motivos das decisões e seus quantitativos CONFORME ÓRGÃO JULGADOR? - confuso, provavelmente n usarei # #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(fundamento, motivo, orgao_julgador)

# Como decide a 5a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 5ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 5ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "QUINTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao) |>
  print(n=85)
    # Como decide a 6a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 6ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 6ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "SEXTA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao) |>
  print(n=93)
    # Como decide a 9a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 9ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 9ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "NONA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao) |>
  print(n=165)
    # Como decide a 10a Turma? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 10ª Turma") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 10ª Turma") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "DÉCIMA TURMA") |>
  dplyr::count(resultado, fundamento, motivo, tipo, data_da_decisao) |>
  print(n=61)
   # Como decide a 1a TRPR? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 1ª TRPR") +
  ggplot2::geom_col(width = 0.80, fill="#A5CEE3",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "PRIMEIRA TURMA RECURSAL DO PR") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 1ª TRPR") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

    # Como decide a 3a TRSC? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "TERCEIRA TURMA RECURSAL DE SC") |>
  dplyr::count(resultado, fundamento, motivo)
    # Como decide a 5a TRRS? #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado)
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE", orgao_julgador == "QUINTA TURMA RECURSAL DO RS") |>
  dplyr::count(resultado, fundamento, motivo)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", title = "Medicamento oncológico - 5ª TRRS") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )


##apenas usada para teste, não vai ficar##
ggplot2::ggplot() +
  ggplot2::aes(x = fundamento, fill = resultado, y = motivo) +
  ggplot2::geom_col()



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


#passo 3: salvar base arrumada#

usethis::use_data(base_arrumada,overwrite = TRUE)
