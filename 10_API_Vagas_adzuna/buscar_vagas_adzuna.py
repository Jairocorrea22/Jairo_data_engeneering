


import json     
import os      
import requests 


APP_ID = "SEU_APP_ID_AQUI"     
APP_KEY = "SUA_APP_KEY_AQUI"   
PAIS = "br"                          
PALAVRA_CHAVE = "Analista de Dados"  
LOCALIZACAO = "Rio de Janeiro"       

PAGINAS = 2                          
RESULTADOS_POR_PAGINA = 50           
MAX_DIAS = 7                         

PASTA_DO_SCRIPT = os.path.dirname(os.path.abspath(__file__))
ARQUIVO_VAGAS_VISTAS = os.path.join(PASTA_DO_SCRIPT, "vagas_vistas.json")




def carregar_ids_vistos():
    """
    Lê o arquivo JSON local (se existir) e devolve um "set" com os IDs
    de vagas já mostradas em execuções anteriores. Se for a primeira vez
    rodando o script, devolve um conjunto vazio.
    """
    if os.path.exists(ARQUIVO_VAGAS_VISTAS):
        with open(ARQUIVO_VAGAS_VISTAS, "r", encoding="utf-8") as f:
            return set(json.load(f))
    return set()


def salvar_ids_vistos(ids_vistos):
    """
    Grava o conjunto de IDs vistos de volta no arquivo JSON.
    json.dump não sabe serializar "set" diretamente, por isso convertemos
    para list() antes de salvar.
    """
    with open(ARQUIVO_VAGAS_VISTAS, "w", encoding="utf-8") as f:
        json.dump(list(ids_vistos), f)




def buscar_vagas():
    
    if APP_ID == "SEU_APP_ID_AQUI" or APP_KEY == "SUA_APP_KEY_AQUI":
        print("⚠️  Configure APP_ID e APP_KEY no topo do script antes de rodar.")
        print("   Registre-se gratuitamente em: https://developer.adzuna.com/")
        return []

    todas_vagas = []

    for pagina in range(1, PAGINAS + 1):
        url = f"https://api.adzuna.com/v1/api/jobs/{PAIS}/search/{pagina}"
        params = {
            "app_id": APP_ID,
            "app_key": APP_KEY,
            "what": PALAVRA_CHAVE,
            "results_per_page": RESULTADOS_POR_PAGINA,
            "max_days_old": MAX_DIAS,
            "sort_by": "date",
            "content-type": "application/json",
        }
        if LOCALIZACAO:
            params["where"] = LOCALIZACAO

        resposta = requests.get(url, params=params)

        if resposta.status_code != 200:
            print(f"Erro na página {pagina}: {resposta.status_code} - {resposta.text}")
            break

        dados = resposta.json()
        vagas = dados.get("results", [])

        if not vagas:
            break

        todas_vagas.extend(vagas)

    return todas_vagas


# ============================================================================
# FUNÇÃO DE EXIBIÇÃO DOS RESULTADOS (somente no terminal, sem salvar arquivo)
# ============================================================================

def mostrar_vagas(vagas):
    """
    Recebe a lista bruta de vagas devolvida pela API, remove as que já
    foram mostradas em execuções anteriores e exibe as novas formatadas
    no terminal.
    """

    if not vagas:
        print("Nenhuma vaga encontrada.")
        return

    ids_vistos = carregar_ids_vistos()
    vagas_novas = [v for v in vagas if v.get("id") not in ids_vistos]
    qtd_repetidas = len(vagas) - len(vagas_novas)

    print(f"\n{len(vagas)} vaga(s) retornada(s) pela API "
          f"({qtd_repetidas} já vistas em execuções anteriores, ignoradas).")

    if not vagas_novas:
        print("Nenhuma vaga NOVA desde a última execução.")
    else:
        print(f"{len(vagas_novas)} vaga(s) nova(s):\n")

        for vaga in vagas_novas:
            titulo = vaga.get("title", "Sem título")
            empresa = vaga.get("company", {}).get("display_name", "Empresa não informada")
            local = vaga.get("location", {}).get("display_name", "Local não informado")
            salario_min = vaga.get("salary_min")
            salario_max = vaga.get("salary_max")
            link_original = vaga.get("redirect_url", "")
            data_publicacao = vaga.get("created", "")

           
            origem = link_original.split("/")[2] if link_original else "desconhecida"

            print(f"📌 {titulo}")
            print(f"   Empresa: {empresa}")
            print(f"   Local: {local}")
            print(f"   Publicada em: {data_publicacao}")
            if salario_min or salario_max:
                print(f"   Salário estimado: R${salario_min} - R${salario_max}")
            print(f"   Fonte: {origem}")
            print(f"   Link: {link_original}")
            print("-" * 60)

    
    ids_vistos.update(v.get("id") for v in vagas if v.get("id"))
    salvar_ids_vistos(ids_vistos)




if __name__ == "__main__":
    vagas = buscar_vagas()
    mostrar_vagas(vagas)
