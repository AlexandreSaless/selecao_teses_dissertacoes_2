########################
## Seleção de Teses e Dissertações - CAPES
##
## Este script tem como objetivo selecionar e organizar dados de teses e dissertações
## disponíveis no portal da CAPES, com base em padrões ou características definidos pelo pesquisador.
## 
## Fonte dos dados: https://dadosabertos.capes.gov.br/dataset
## Desenvolvedor original: Alexandre Sales
## Observação: recomenda-se ao menos 12 GB de RAM devido ao volume dos dados
########################

# Definir o diretório de trabalho

# Carregando pacotes necessários
library(tidyverse)
library(readxl)
library(dplyr)
library(openxlsx)

# ------------------------------------------------------------
# BLOCO 0 – Importação de dados de 1987 a 2012
# ------------------------------------------------------------

# Leitura dos arquivos anuais (tipo texto para evitar problemas de formatação)
dados87 <- read_excel('dados_1987.xlsx', col_types = "text")
dados88 <- read_excel('dados_1988.xlsx', col_types = "text")
dados89 <- read_excel('dados_1989.xlsx', col_types = "text")
dados90 <- read_excel('dados_1990.xlsx', col_types = "text")
dados91 <- read_excel('dados_1991.xlsx', col_types = "text")
dados92 <- read_excel('dados_1992.xlsx', col_types = "text")
dados93 <- read_excel('dados_1993.xlsx', col_types = "text")
dados94 <- read_excel('dados_1994.xlsx', col_types = "text")
dados95 <- read_excel('dados_1995.xlsx', col_types = "text")
dados96 <- read_excel('dados_1996.xlsx', col_types = "text")
dados97 <- read_excel('dados_1997.xlsx', col_types = "text")
dados98 <- read_excel('dados_1998.xlsx', col_types = "text")
dados99 <- read_excel('dados_1999.xlsx', col_types = "text")
dados00 <- read_excel('dados_2000.xlsx', col_types = "text")
dados01 <- read_excel('dados_2001.xlsx', col_types = "text")
dados02 <- read_excel('dados_2002.xlsx', col_types = "text")
dados03 <- read_excel('dados_2003.xlsx', col_types = "text")
dados04 <- read_excel('dados_2004.xlsx', col_types = "text")
dados05 <- read_excel('dados_2005.xlsx', col_types = "text")
dados06 <- read_excel('dados_2006.xlsx', col_types = "text")
dados07 <- read_excel('dados_2007.xlsx', col_types = "text")
dados08 <- read_excel('dados_2008.xlsx', col_types = "text")
dados09 <- read_excel('dados_2009.xlsx', col_types = "text")
dados10 <- read_excel('dados_2010.xlsx', col_types = "text")
dados11 <- read_excel('dados_2011.xlsx', col_types = "text")
dados12 <- read_excel('dados_2012.xlsx', col_types = "text")

# Agrupamento em único dataframe
dfBloco0 <- rbind(
  dados87, dados88, dados89, dados90, dados91, dados92, dados93, dados94, dados95, dados96,
  dados97, dados98, dados99, dados00, dados01, dados02, dados03, dados04, dados05, dados06,
  dados07, dados08, dados09, dados10, dados11, dados12
)

# Renomeia e remove colunas desnecessárias
dfBloco0 <- dfBloco0 %>%
  rename(
    AN_BASE = AnoBase,
    CD_PROGRAMA = CodigoPrograma,
    NM_PROGRAMA = NomePrograma,
    NM_ENTIDADE_ENSINO = NomeIes,
    SG_ENTIDADE_ENSINO = SiglaIes,
    NM_REGIAO = Regiao,
    SG_UF_IES = Uf,
    CD_GRANDE_AREA_CONHECIMENTO = GrandeAreaCodigo,
    NM_GRANDE_AREA_CONHECIMENTO = GrandeAreaDescricao,
    CD_AREA_CONHECIMENTO = AreaConhecimentoCodigo,
    NM_AREA_CONHECIMENTO = AreaConhecimento,
    NM_AREA_AVALIACAO = AreaAvaliacao,
    NM_PRODUCAO = TituloTese,
    NM_DISCENTE = Autor,
    NM_GRAU_ACADEMICO = Nivel,
    DT_TITULACAO = DataDefesa,
    DS_PALAVRA_CHAVE = PalavrasChave,
    DS_RESUMO = ResumoTese,
    NM_LINHA_PESQUISA = LinhaPesquisa,
    NM_IDIOMA = Idioma,
    NR_PAGINAS = NumeroPaginas,
    NR_VOLUME = Volume,
    DS_URL_TEXTO_COMPLETO = URLTextoCompleto,
    NM_ORIENTADOR = Orientador_1,
    DS_BIBLIOTECA_DEPOSITARIA = BibliotecaDepositaria
  ) %>%
  select(-c(
    DocumentoDiscente, DocumentoOrientador_1, DocumentoOrientador_2,
    DocumentoOrientador_3, DocumentoOrientador_4,
    DocumentoCoOrientador_1, DocumentoCoOrientador_2,
    DocumentoCoOrientador_3, DocumentoCoOrientador_4,
    Orientador_2, Orientador_3, Orientador_4,
    CoOrientador_1, CoOrientador_2, CoOrientador_3, CoOrientador_4
  ))

# Remove arquivos intermediários para liberar memória
rm(dados87, dados88, dados89, dados90, dados91, dados92, dados93, dados94, dados95, dados96,
   dados97, dados98, dados99, dados00, dados01, dados02, dados03, dados04, dados05, dados06,
   dados07, dados08, dados09, dados10, dados11, dados12)

# ------------------------------------------------------------
# BLOCO I – Dados de 2013 a 2016
# ------------------------------------------------------------
dados13 <- read_excel("br-capes-btd-2013a2016-2017-12-01_2013.xlsx", col_types = "text")
dados14 <- read_excel("br-capes-btd-2013a2016-2017-12-01_2014.xlsx", col_types = "text")
dados15 <- read_excel("br-capes-btd-2013a2016-2017-12-01_2015.xlsx", col_types = "text")
dados16 <- read_excel("br-capes-btd-2013a2016-2017-12-01_2016.xlsx", col_types = "text")

dfBlocoI <- rbind(dados13, dados14, dados15, dados16)
rm(dados13, dados14, dados15, dados16)

# ------------------------------------------------------------
# BLOCO II – Dados de 2017 a 2020
# ------------------------------------------------------------
dados17 <- read_excel("br-capes-btd-2017a2020-2021-12-03_2017.xlsx", col_types = "text")
dados18 <- read_excel("br-capes-btd-2017a2020-2021-12-03_2018.xlsx", col_types = "text")
dados19 <- read_excel("br-capes-btd-2017a2020-2021-12-03_2019.xlsx", col_types = "text")
dados20 <- read_excel("br-capes-btd-2017a2020-2021-12-03_2020.xlsx", col_types = "text")

dfBlocoII <- rbind(dados17, dados18, dados19, dados20)
rm(dados17, dados18, dados19, dados20)

# ------------------------------------------------------------
# BLOCO III – Dados de 2021 e 2022
# ------------------------------------------------------------
dados21 <- read_excel("br-capes-btd-2021-2023-10-31.xlsx", col_types = "text")
dados22 <- read_excel("br-capes-btd-2022-2023-10-31.xlsx", col_types = "text")

dfBlocoIII <- rbind(dados21, dados22)
rm(dados21, dados22)

# ------------------------------------------------------------
# Unificação final de todos os blocos
# ------------------------------------------------------------

# Usa colunas do dfBloco0 como base para padronizar
colunas_comuns <- names(dfBloco0)

# Empilha todos os blocos mantendo a consistência de colunas
df <- rbind(
  dfBloco0[ , colunas_comuns],
  dfBlocoI[ , colunas_comuns],
  dfBlocoII[ , colunas_comuns],
  dfBlocoIII[ , colunas_comuns]
)

# Limpeza de memória
rm(dfBloco0, dfBlocoI, dfBlocoII, dfBlocoIII)

# Exporta o dataset final para arquivo CSV
write.csv2(df, "C:/Users/alexa/OneDrive/Área de Trabalho/df.csv")

# ------------------------------------------------------------
# Filtro por região da Amazônia Legal
# ------------------------------------------------------------
# Seleciona teses e dissertações produzidas na Amazônia Legal

# Siglas dos estados da Amazônia Legal
estados_amazonia_legal <- c("AC", "AP", "AM", "MA", "MT", "PA", "RO", "RR", "TO")

# Filtra registros com base na sigla da UF
df_amazonia <- df %>%
  filter(SG_UF_IES %in% estados_amazonia_legal)

# ------------------------------------------------------------
# Exemplos de Filtros Temáticos
# ------------------------------------------------------------
# Seleciona as produções que apresentam em qualquer variável de seus
# metadados o termo "matemática" e "ensino ou educação"

# Filtro geral por palavra-chave em qualquer campo
palavra_chave <- "matemática"

df_matematica <- df_amazonia %>%
  filter(if_any(everything(), ~ str_detect(., regex(palavra_chave, ignore_case = TRUE))))

# Busca por várias palavras-chave
palavras_chave <- c("educação", "ensino")

df_geral_metadados <- df_matematica %>%
  filter(if_any(everything(), ~ str_detect(., regex(str_c(palavras_chave, collapse = "|"), ignore_case = TRUE))))

# ------------------------------------------------------------
# Filtros por nome do programa e linha de pesquisa
# ------------------------------------------------------------
# Seleciona as produções que apresentam programas ou linhas de pesquisa
# com o termo "matemática" e "ensino ou educação"

palavra_chave <- "matemática"

df_matematica_foco <- df_amazonia %>%
  filter(
    str_detect(NM_PROGRAMA, regex(palavra_chave, ignore_case = TRUE)) |
      str_detect(NM_LINHA_PESQUISA, regex(palavra_chave, ignore_case = TRUE))
  )

palavras_chave <- c("educação", "ensino")

df_matematica_educacao_foco <- df_matematica_foco %>%
  filter(
    str_detect(NM_PROGRAMA, regex(str_c(palavras_chave, collapse = "|"), ignore_case = TRUE)) |
      str_detect(NM_LINHA_PESQUISA, regex(str_c(palavras_chave, collapse = "|"), ignore_case = TRUE))
  )

# ------------------------------------------------------------
# Filtros por Título, Resumo e Palavras-chave
# ------------------------------------------------------------
# Seleciona as produções que apresentam em seu título, resumo ou palavrs-chave
# o termo "matemática" e "ensino ou educação

palavra_chave <- "matemática"

df_matematica_texto <- df_amazonia %>%
  filter(
    str_detect(NM_PRODUCAO, regex(palavra_chave, ignore_case = TRUE)) |
      str_detect(DS_RESUMO, regex(palavra_chave, ignore_case = TRUE)) |
      str_detect(DS_PALAVRA_CHAVE, regex(palavra_chave, ignore_case = TRUE))
  )

palavras_chave <- c("educação", "ensino")

df_matematica_educacao_texto <- df_matematica_texto %>%
  filter(
    str_detect(NM_PRODUCAO, regex(str_c(palavras_chave, collapse = "|"), ignore_case = TRUE)) |
      str_detect(DS_RESUMO, regex(str_c(palavras_chave, collapse = "|"), ignore_case = TRUE)) |
      str_detect(DS_PALAVRA_CHAVE, regex(str_c(palavras_chave, collapse = "|"), ignore_case = TRUE))
  )

# ------------------------------------------------------------
# Filtros por Título, Resumo e Palavras-chave
# ------------------------------------------------------------
# Seleciona as produções que apresentam em seu título, resumo ou palavrs-chave
# o termo "educação matemática", "ensino de matemática", "ensino da matemática"

palavras_chave <- c("educação matemática", "ensino de matemática", "ensino da matemática")

df_matematica_educacao_enisno_matemática <- df_amazonia %>%
  filter(
    str_detect(NM_PRODUCAO, regex(str_c(palavras_chave, collapse = "|"), ignore_case = TRUE)) |
      str_detect(DS_RESUMO, regex(str_c(palavras_chave, collapse = "|"), ignore_case = TRUE)) |
      str_detect(DS_PALAVRA_CHAVE, regex(str_c(palavras_chave, collapse = "|"), ignore_case = TRUE))
  )
