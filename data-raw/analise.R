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

# também funcionou girando os nomes, mas acho que fica mais difícil de visualizar #
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

# PARA ATUALIZAR TOKEN #
gitcreds::gitcreds_set()
