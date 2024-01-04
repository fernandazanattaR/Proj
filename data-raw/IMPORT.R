#passo 1: autenticar#

googlesheets4::gs4_auth("falecomfernandalemos@gmail.com")

#passo 2: determinar o seu sheets#

link <- "https://docs.google.com/spreadsheets/d/1As6YTSzYW1-wMp8COhXtMAXuoG1Perf1YXa66uwrcP4/edit#gid=652374994"

#passo 3: baixar a base de dados#

meses <- c(4:12)
#
base_original <- tibble::tibble()
#
for(mes in meses) {
  mes_seguinte <- mes + 1

  if(stringr::str_length(mes) == 1) {
    mes <- paste0("0", mes)
  } else {
    mes <- as.character(mes)
  }

  if(stringr::str_length(mes_seguinte) == 1) {
    mes_seguinte <- paste0("0", mes_seguinte)
  } else {
    mes_seguinte <- as.character(mes_seguinte)
  }

  nome_aba <- glue::glue("da_{mes}_{mes_seguinte}")

  base_sheets <- googlesheets4::read_sheet(link, sheet = nome_aba)

  base_original <- base_original |>
    dplyr::bind_rows(base_sheets)

}

#passo 4: salvar#

usethis::use_data(base_original,overwrite = TRUE)
