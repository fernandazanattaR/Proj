#passo 1:
devtools::load_all(".")

#importar a base
base_arrumada <- Proj::base_arrumada

# passo 2: análises #

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

# FUNCIONOU ÓTIMO 1 #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  ggplot2::ggplot() +
  ggplot2::facet_wrap(~orgao_julgador) +
  ggplot2::aes(x = n, fill = motivo, y = orgao_julgador) +
  ggplot2::geom_col(position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired")

#com label#
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = orgao_julgador, fill = motivo, y = n) +
  ggplot2::geom_col(position="dodge2") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle=45, hjust=1)) +
  ggplot2::scale_fill_brewer(palette = "Paired")

# também funcionou girando os nomes, esse ficou bom #
base_arrumada |>
  dplyr::filter(prestação == "medicamento" & oncológico == "TRUE") |>
  dplyr::count(fundamento, motivo, orgao_julgador) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = orgao_julgador, fill = motivo, y = n, label = n) +
  ggplot2::labs(x = "Órgão Julgador", y = "Quantitativo", title = "Medicamentos Oncológicos") +
  ggplot2::geom_col(width = 0.80,
    position=ggplot2::position_dodge2(0.2)) +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle=45, hjust=1)) +
  ggplot2::scale_y_continuous(breaks = seq(0, 300, by = 50)) +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
    position=ggplot2::position_dodge2(width=0.80)
  )


#acima só tirar o width=0.40#


## artigo conpedi ##
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
  ggplot2::geom_col(width = 0.80, fill="#2078B4",
                    position="dodge2") +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle=25, hjust=1)) +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#2078B4",
                      position=ggplot2::position_dodge2(width=0.80)
  )

#dos que tiveram análise de competência - a origem #
base_arrumada |>
  dplyr::filter(exclusão == "não") |>
  dplyr::count(justiça)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = justiça, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Origem", title = "Origem das demandas") +
  ggplot2::geom_col(width = 0.80, fill="#2078B4",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#2078B4",
                      position=ggplot2::position_dodge2(width=0.80)
  )

#quantos foram declinadas e quantas foram mantidas#
base_arrumada |>
  dplyr::filter(exclusão == "não") |>
  dplyr::count(resultado)|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Análise da competência") +
  ggplot2::geom_col(width = 0.80, fill="#2078B4",
                    position="dodge2") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#2078B4",
                      position=ggplot2::position_dodge2(width=0.80)
  )

# 3ª Seção #
base_arrumada |>
  dplyr::filter(orgao_julgador == "TERCEIRA SEÇÃO") |>
  dplyr::count(motivo) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = motivo, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "3ª Seção - Motivo") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )
base_arrumada |>
  dplyr::filter(orgao_julgador == "TERCEIRA SEÇÃO") |>
  dplyr::count(exclusão) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = exclusão, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "3ª Seção - Ausência de análise") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )
#sobrestou count#
base_arrumada |>
  dplyr::filter(orgao_julgador == "TERCEIRA SEÇÃO" & exclusão == "sobrestou") |>
  dplyr::count(processo)

#decisões díspares da 5TRRS padronizado 5.2#
base_arrumada |>
  dplyr::filter(orgao_julgador == "QUINTA TURMA RECURSAL DO RS" & fundamento == "5.2" & prestação == "procedimento padronizado") |>
  dplyr::count(fundamento, rel, data_da_decisao)


#testes#
#aqui encontrei quanto de cada prestação#
base_arrumada |>
  dplyr::filter(prestação == "medicamento" | prestação == "procedimento padronizado" | prestação == "procedimento não padronizado" | prestação == "atendimento médico domiciliar" | prestação == "insumo") |>
  dplyr::count(prestação)
#aqui encontrei quanto de cada prestação mais os NA que engloba os não analisados e os sem prestação#
base_arrumada |>
  dplyr::count (prestação)

base_arrumada |>
  dplyr::filter(orgao_julgador == "TERCEIRA SEÇÃO") |>
  dplyr::count(exclusão) |>
  ggplot2::ggplot() +
  ggplot2::aes(x = exclusão, y = n, label = n) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "3ª Seção - Ausência de análise") +
  ggplot2::geom_col(position="dodge2", fill="#A5CEE3") +
  ggplot2::geom_label(label.size = 0, size = 3, fill="#A5CEE3",
                      position=ggplot2::position_dodge2(width=0.80)
  )

base_arrumada |>
  dplyr::filter(prestação == "medicamento"  & oncológico == "FALSE" & motivo == "vedação de declinação da competência" & orgao_julgador == "VICE-PRESIDÊNCIA") |>
  dplyr::count(resultado, processo, motivo)

|>
  ggplot2::ggplot() +
  ggplot2::aes(x = resultado, y = n, fill = motivo, label = n) +
  ggplot2::facet_wrap(~fundamento) +
  ggplot2::labs(y = "Quantitativo", x = "Resultado", title = "Medicamento não oncológico - 5ª TRRS") +
  ggplot2::geom_col(width = 0.80,
                    position="dodge2") +
  ggplot2::scale_fill_brewer(palette = "Paired") +
  ggplot2::geom_label(label.size = 0, size = 2, show.legend = FALSE,
                      position=ggplot2::position_dodge2(width=0.80)
  )

# PARA ATUALIZAR TOKEN #
gitcreds::gitcreds_set()
