# Contrato Bomboniere

## Produto

- `idProduto` pk,uuid, obrigatório
- `nome` varchar, obrigatório
- `preço` double, obrigatório
- `quantidade` int, obrigatório
- `status` string, obrigatório

## Ingrediente

- `nome` varchar,obrigatório
- `unidadeMedida` double, obrigatório
- `idIngrediente` PK, uuid, obrigatório
- `idReceita` FK, uuid, obrigatório
- `quantidade` int, obrigatório

## Receita

- `idReceita` PK, uuid, obrigatório
- `idIngrediente` FK, uuid, obrigatório
- `nome` varchar, obrigatório
- `status` varchar, obrigatório

## Cardapio

- `idCardapio` PK, uuid, obrigatório
- `idReceita` FK, uuid, obrigatório
- `nome` varchar, obrigatório
- `status` varchar, obrigatório
- `dataCriacao` date, obrigatório
- `dataEncerramento` date, obrigatório

## Item de cardapio

- `nomeItem` varchar, obrigatório
- `idCardapio` FK, uuid, obrigatório
- `idProduto` FK, uuid, obrigatório
- `idReceita` FK, uuid, obrigatório
- `preço` double, obrigatório
- `status` varchar, obrigatório

## Pedido

- `idPedido` Pk, uuid, obrigatório
- `statusItem` varchar, obrigatório
- `origem` int, obrigatório
- `preçoTotal` double, obrigatório
- `preçoHistorico` double, obrigatório
- `status` varchar, obrigatório
- `prioridadeVIP` boolean, obrigatório

## Exemplos de request:

### Produto:

    {   
    “nome”: ”nome”,
    }

### Ingrediente:
    {
    “nomeIngrediente”: “ingrediente ”
    }

### Receita:
	{
	“nomeReceita”: “receita”
	}

### Cardapio:
	{
	“idCardapio”: ”idCardapio”
	}

### Item Cardapio:
	{
	“idItemCardapio”: “idItemCardapio”
	}

### Pedido:
	{
	“idPedido”: “idPedido”
	}

## Exemplos de resposta

### Produto

    {
    “nomeProduto”: “nomeProduto”,
    “idProduto”: “idProduto”,
    “preço”: “preço”,
    “quantidade” : “quantidade”,
    “status” : “status”
    }

### Ingrediente:
    {
    “nomeIngrediente“: “nomeIngrediente”,
    “unidadeMedida”: “unidadeMedida”,
    “idIngrediente”: “idIngrediente”,
    “idReceita “: “idReceita,
    “quantidadeIngrediente”: “quantidadeIngrediente”
    }

### Receita:
	{
	“nomeReceita”: “receita”
	“idIngrediente”: “idIngrediente”
	“idReceita”: “idReceita”
	“statusReceita”: “statusReceita”
	}

### Cardapio:
	{
	“idCardapio”: ”idCardapio”
	“idReceita”: “idReceita”
	“nomeProdutoCardapio”: “nomeProdutoCardapio”
	“statusCardapio”: “statusCardapio”
	“dataCriacao”: “dataCriacao”
	“dataEncerramento” : “dataEncerramento”
	}

### Item Cardapio:
	{
	“idItemCardapio”: “idItemCardapio”
	“nomeItemCardapio”: “nomeItemCardapio”
	“idProduto”: “idProduto”
	“idReceita”: “idReceita”
	“preçoItemCardapio”: “preçoItemCardapio”
	“statusItemCardapio”: “statusItemCardapio”
	}

### Pedido:
	{
	“idPedido”: “idPedido”,	
    “statusItem” : “status”,
    “origem”: “origem”,
    “preçoTotal”: “preçoTotal”,
    “preçoHistorico”: “preçoHistorico”,
    “statusPedido”: “statusPedido”,
    “prioridadeVIP”: boolean
    }
    