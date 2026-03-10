# Contrato Bomboniere

## Produto

- `id` pk,uuid, obrigatório
- `name` string, obrigatório
- `price` double, obrigatório
- `stock` int, obrigatório
- `status` string, obrigatório

## Ingrediente

- `name` string,obrigatório
- `unidadeMedida` double, obrigatório
- `id` PK, uuid, obrigatório
- `stock` int, obrigatório
- `recipes` [], obrigatório

## Receita

- `id` PK, uuid, obrigatório
- `description` string
- `name` string, obrigatório
- `status` string, obrigatório
- `ingredients` [], obrigatorio

## Cardapio

- `id` PK, uuid, obrigatório
- `name` string, obrigatório
- `status` string, obrigatório
- `dataCriacao` date, obrigatório
- `dataEncerramento` date, obrigatório
- `cardapioItens`[], obrigatorio

## Item de cardapio

- `nameItem` string, obrigatório
- `idCardapio` FK, uuid, obrigatório
- `preço` double, obrigatório
- `status` string, obrigatório
- `idProduto` FK, uuid, obrigatório | `idReceita` FK, uuid, obrigatorio (ou um ou outro não pode haver os dois fks ao mesmo tempo)
- `cardapios` [], obrigatorio

## Pedido

- `id` Pk, uuid, obrigatório
- `origem` string, obrigatório
- `session` string, obrigatorio se a origem for cinema
- `seat` string, obrigatorio se a origem for cinema
- `userId` string, obrigatorio se a origem for app
- `dataCriacao` date, obrigatorio
- `status` string, obrigatório
  - `created` estado inicial, assim que a requisição foi feita
  - `preparing` pedido recebido pela cozinha e em preparo
  - `ready` pedido pronto para ser retirado(no caso de app ou caixa)
  - `delivered` pedido saiu para entrega(no caso do vip)
  - `cancelled` pedido cancelado
- `orderItems` [], obrigatorio

## Item do Pedido

- `id` PK, uuid, obrigatorio
- `idItemCardapio` FK, uuid, obrigatorio
- `price` double, obrigatorio
- `name` string, obrigatorio
- `idPedido` FK, uuid, obrigatorio

## Exemplos de request:

### Produto:

    {
    id: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    name: "Refrigerante lata Coca-Cola 300ml",
    price: 5.00,
    stock: 10,
    status: "ativo" | "inativo"
    }

### Ingrediente:

    {
    id:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    name:"milho",
    unidadeMedida: "grama",
    stock:"2000",
    recipes: [
    	{
    		idReceita:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    		idIngredientes:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    		quantidade:"20"
    	},
    ]
    }

### Receita:

    {
    	id: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    	name:"Pipoca salgada grande",
    	status: "ativo" | "inativo",
    	price: 20.00,
    	ingredients: [
    		{
    			idReceita: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    			idIngredientes:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    			quantidade:"20"
    		}
    	]
    }

### Cardapio:

    {
    id: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    name: "Cardápio promocional de natal",
    status: "ativo" | "inativo",
    dataEncerramento: "20102026" -> adicionar barra
    cardapioItems: [
        {
            idIngrediente:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            idItemcardapio: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            price:35.00
        }
    ]
    }

### Item Cardapio:

    {
    id: “d603bda9-a6aa-4ebe-bd72-51a900301b2d”,
    name:"Pipoca salgada grande",
    status: "ativo" | "inativo",
    idProduto:"d603bda9-a6aa-4ebe-bd72-51a900301b2d", *coment* ou idReceita, não pode ser os dois ao mesmo tempo
    cardapios: [
        {
            idCardapio: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            idItemCardapio:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            price:35.00
        }
    ]
    }

### Pedido:

    {
    id: “d603bda9-a6aa-4ebe-bd72-51a900301b2d”,
    origem: "caixa" | "app" | "cinema",
    session: "Homem-aranha 21:00 sala B",
    seat: "F21",
    userId: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    dataCriacao: 21032026,
    status: "created" | "preparing" | "ready" | "delivered" | "cancelled",
    orderItems: [
        {
            itemPedido:"d603bda9-a6aa-4ebe-bd72-51a900301b2d"
        }
    ]
    }

## Item do Pedido

{
id:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
idItemCardapio: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
price: 35.00,
name: "Pipoca grande salgada",
pedidoId:"d603bda9-a6aa-4ebe-bd72-51a900301b2d"
}

## Exemplos de resposta

### Produto

    {
    id: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    name: "Refrigerante lata Coca-Cola 300ml",
    price: 5.00,
    stock: 10,
    status: "ativo" | "inativo"
    }

### Ingrediente:

    {
    id:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    name:"milho",
    unidadeMedida: "grama",
    stock:"2000",
    recipes: [
    	{
    		idReceita:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    		idIngredientes:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    		quantidade:"20"
    	},
    ]
    }

### Receita:

    {
    	id: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    	name:"Pipoca salgada grande",
    	status: "ativo" | "inativo",
    	price: 20.00,
    	ingredients: [
    		{
    			idReceita: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    			idIngredientes:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    			quantidade:"20"
    		}
    	]
    }

### Cardapio:

    {
    id: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    name: "Cardápio promocional de natal",
    status: "ativo" | "inativo",
    dataEncerramento: "20102026" -> adicionar barra
    cardapioItems: [
        {
            idIngrediente:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            idItemcardapio: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            price:35.00
        }
    ]
    }

### Item Cardapio:

    {
    id: “d603bda9-a6aa-4ebe-bd72-51a900301b2d”,
    name:"Pipoca salgada grande",
    status: "ativo" | "inativo",
    idProduto:"d603bda9-a6aa-4ebe-bd72-51a900301b2d", *coment* ou idReceita, não pode ser os dois ao mesmo tempo
    cardapios: [
        {
            idCardapio: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            idItemCardapio:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
            price:35.00
        }
    ]
    }

### Pedido:

    {
    id: “d603bda9-a6aa-4ebe-bd72-51a900301b2d”,
    origem: "caixa" | "app" | "cinema",
    session: "Homem-aranha 21:00 sala B",
    seat: "F21",
    userId: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
    dataCriacao: 21032026,
    status: "created" | "preparing" | "ready" | "delivered" | "cancelled",
    orderItems: [
        {
            itemPedido:"d603bda9-a6aa-4ebe-bd72-51a900301b2d"
        }
    ]
    }

## Item do Pedido

{
id:"d603bda9-a6aa-4ebe-bd72-51a900301b2d",
idItemCardapio: "d603bda9-a6aa-4ebe-bd72-51a900301b2d",
price: 35.00,
name: "Pipoca grande salgada",
pedidoId:"d603bda9-a6aa-4ebe-bd72-51a900301b2d"
}
