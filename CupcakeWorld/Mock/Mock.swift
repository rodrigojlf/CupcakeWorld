//
//  Mock.swift
//  CupcakeWorld
//
//  Created by Rodrigo Lima on 14/03/26.
//

import UIKit

struct Mock {
    
    var banners: [UIImage] {
        var images: [UIImage] = []
        guard let banner1 = UIImage(named: "banner1") else { return images }
        images.append(banner1)
        guard let banner2 = UIImage(named: "banner2") else { return images }
        images.append(banner2)
        guard let banner3 = UIImage(named: "banner3") else { return images }
        images.append(banner3)
        return images
    }
    
    var user: User = User(name: "Rodrigo Lima",
                          addresses: [
                            Address(street: "Rua de Casa",
                                    number: "123",
                                    complement: "casa",
                                    city: "Caruaru",
                                    state: "PE",
                                    zipCode: "55000-111",
                                    country: "Brazil",
                                    name: "Casa",
                                    type: AddressType.home.rawValue),
                            Address(street: "Rua do Trabalho",
                                    number: "456",
                                    complement: "Sala 2005",
                                    city: "Recife",
                                    state: "PE",
                                    zipCode: "55000-000",
                                    country: "Brazil",
                                    name: "Edf. Prédio Alto",
                                    type: AddressType.work.rawValue,
                                    instructions: "Em frente à Padaria Pães e Delícias"),
                            Address(street: "Rua do Hotel",
                                    number: "789",
                                    complement: "Apto. 701",
                                    city: "João Pessoa",
                                    state: "PB",
                                    zipCode: "55000-222",
                                    country: "Brazil",
                                    type: AddressType.other.rawValue,
                                    isActive: true)
                          ])
    
    var cupcakes: [Cupcake] = [
        Cupcake(
            name: "Red Velvet",
            price: 12.90,
            imageUrl: "https://images.unsplash.com/photo-1614707267537-b85aaf00c4b7?q=80&w=987&auto=format&fit=crop",
            categories: ["premium", "festa"],
            details: "O clássico americano com massa aveludada de cacau e cobertura cremosa de cream cheese.",
            tags: ["bestSeller", "recomended"]
        ),
        Cupcake(
            name: "Chocolate Triplo",
            price: 14.50,
            imageUrl: "https://images.unsplash.com/photo-1652284918100-1fd4a60e7356?q=80&w=3087&auto=format&fit=crop",
            categories: ["premium"],
            details: "Massa de chocolate belga, recheio de ganache meio amargo e raspas de chocolate ao leite.",
            tags: ["bestSeller"]
        ),
        Cupcake(
            name: "Limão Siciliano",
            price: 9.90,
            imageUrl: "https://images.unsplash.com/photo-1576618148400-f54bed99fcfd?q=80&w=1480&auto=format&fit=crop",
            categories: ["festa"],
            details: "Equilíbrio perfeito entre a massa cítrica leve e um merengue suíço maçaricado.",
            tags: ["discount"]
        ),
        Cupcake(
            name: "Baunilha Bourbon",
            price: 8.50,
            imageUrl: "https://images.unsplash.com/photo-1771016833943-af6452d6be64?q=80&w=2070&auto=format&fit=crop",
            categories: ["festa", "premium"],
            details: "Extrato natural de baunilha Bourbon de Madagascar com buttercream suave.",
            tags: ["recomended"]
        ),
        Cupcake(
            name: "Morango Silvestre",
            price: 11.00,
            imageUrl: "https://images.unsplash.com/photo-1658980356196-d0b13c84e6ab?q=80&w=2070&auto=format&fit=crop",
            categories: ["vegano", "festa"],
            details: "Feito com morangos frescos e massa orgânica sem ingredientes de origem animal.",
            tags: ["recomended"]
        ),
        Cupcake(
            name: "Caramelo Salgado",
            price: 13.50,
            imageUrl: "https://images.unsplash.com/photo-1601045263606-b31b202de911?q=80&w=1035&auto=format&fit=crop",
            categories: ["premium"],
            details: "Massa amanteigada recheada com caramelo artesanal e um toque de flor de sal.",
            tags: ["bestSeller"]
        ),
        Cupcake(
            name: "Blueberry Bliss",
            price: 10.50,
            imageUrl: "https://images.unsplash.com/photo-1658980356198-b228e003628d?q=80&w=2070&auto=format&fit=crop",
            categories: ["vegano"],
            details: "Massa leve de mirtilos frescos com cobertura de frosting de coco e limão.",
            tags: ["discount"]
        ),
        Cupcake(
            name: "Cookies & Cream",
            price: 12.00,
            imageUrl: "https://images.unsplash.com/photo-1552253225-1164d58e3558?q=80&w=2071&auto=format&fit=crop",
            categories: ["festa"],
            details: "Pedaços crocantes de biscoito negresco tanto na massa quanto no creme.",
            tags: ["bestSeller", "recomended"]
        ),
        Cupcake(
            name: "Pistache Real",
            price: 15.90,
            imageUrl: "https://images.unsplash.com/photo-1722417129460-5b5b84728fac?q=80&w=987&auto=format&fit=crop",
            categories: ["premium"],
            details: "Pistaches iranianos selecionados com uma textura densa e sabor sofisticado.",
            tags: ["recomended"]
        ),
        Cupcake(
            name: "Cenoura com Brigadeiro",
            price: 9.00,
            imageUrl: "https://images.unsplash.com/photo-1587536849024-daaa4a417b16?q=80&w=987&auto=format&fit=crop",
            categories: ["festa"],
            details: "O favorito das crianças: massa de cenoura fofinha e topo de brigadeiro gourmet.",
            tags: ["bestSeller", "discount"]
        ),
        Cupcake(
            name: "Amora & Lavanda",
            price: 14.00,
            imageUrl: "https://images.unsplash.com/photo-1710941482001-1e713ea2bd5f?q=80&w=2070&auto=format&fit=crop",
            categories: ["premium"],
            details: "Uma combinação floral e frutada única, ideal para paladares refinados.",
            tags: []
        ),
        Cupcake(
            name: "Doce de Leite",
            price: 11.50,
            imageUrl: "https://images.unsplash.com/photo-1623293605896-6dc523bb02e5?q=80&w=1035&auto=format&fit=crop",
            categories: ["festa"],
            details: "Massa de canela recheada com doce de leite argentino legítimo.",
            tags: ["bestSeller"]
        ),
        Cupcake(
            name: "Menta Choc",
            price: 10.90,
            imageUrl: "https://images.unsplash.com/photo-1587668178538-c07606344e4f?q=80&w=987&auto=format&fit=crop",
            categories: ["festa"],
            details: "Refrescância da menta combinada com gotas de chocolate 70% cacau.",
            tags: []
        ),
        Cupcake(
            name: "Coco Queimado",
            price: 9.50,
            imageUrl: "https://images.unsplash.com/photo-1710981998030-b047cf5b90b0?q=80&w=987&auto=format&fit=crop",
            categories: ["festa"],
            details: "Massa de leite de coco com cobertura de coco ralado tostado na hora.",
            tags: ["recomended"]
        ),
        Cupcake(
            name: "Tiramisu",
            price: 14.80,
            imageUrl: "https://images.unsplash.com/photo-1659549591799-0ba408a9b29a?q=80&w=2070&auto=format&fit=crop",
            categories: ["premium"],
            details: "Inspirado na sobremesa italiana, com café expresso e creme de mascarpone.",
            tags: ["bestSeller", "recomended"]
        ),
        Cupcake(
            name: "Maracujá Tropical",
            price: 10.00,
            imageUrl: "https://images.unsplash.com/photo-1771016833930-859834ab08ad?q=80&w=987&auto=format&fit=crop",
            categories: ["vegano", "festa"],
            details: "Sabor vibrante e azedinho do maracujá em uma base 100% vegetal.",
            tags: ["discount"]
        ),
        Cupcake(
            name: "Nutella & Avelã",
            price: 16.00,
            imageUrl: "https://images.unsplash.com/photo-1603532648955-039310d9ed75?q=80&w=987&auto=format&fit=crop",
            categories: ["festa", "premium"],
            details: "Recheio generoso de Nutella com avelãs inteiras crocantes no topo.",
            tags: ["bestSeller"]
        ),
        Cupcake(
            name: "Abacaxi com Hortelã",
            price: 9.90,
            imageUrl: "https://images.unsplash.com/photo-1732966283172-033d29bf02ca?q=80&w=1064&auto=format&fit=crop",
            categories: ["vegano"],
            details: "Leve e refrescante, perfeito para dias quentes de verão.",
            tags: ["recomended", "discount"]
        ),
        Cupcake(
            name: "Marshmallow Tostado",
            price: 12.50,
            imageUrl: "https://plus.unsplash.com/premium_photo-1723489288609-9467f74af1f2?q=80&w=2070&auto=format&fit=crop",
            categories: ["festa"],
            details: "Massa de baunilha com topo de marshmallow artesanal gratinado.",
            tags: ["recomended"]
        ),
        Cupcake(
            name: "Chai Spice",
            price: 13.00,
            imageUrl: "https://images.unsplash.com/photo-1671222872873-f4587a665453?q=80&w=987&auto=format&fit=crop",
            categories: ["premium"],
            details: "Mix de especiarias indianas com um toque sutil de canela e cardamomo.",
            tags: ["recomended"]
        )
    ]
}
