//
//  Idos.swift
//  ThinkAlot
//
//  Created by xiang zhuo on 2018/4/16.
//  Copyright © 2018年 xiang zhuo. All rights reserved.
//

import UIKit

struct Idos {
    var name: String
    var image: UIImage
    var shortDescription: String
    var description: String
}

struct IdosStore {
    var idos = [
        Idos(name: "Grooming",
             image: UIImage(named: "1.png")!,
             shortDescription: "Chopping and traveling all over the world.",
             description: """
            From tomorrow on,I will be a happy man.
            Grooming,chopping and traveling all over the world.
            From tomorrow on,I will care foodstuff and vegetable.
            Living in a house towards the sea, with spring blossoms.
            """),
        Idos(name: "Happiness",
             image: UIImage(named: "2.png")!,
             shortDescription: "Telling them of my happiness.",
             description: """
            From tomorrow on,write to each of my dear ones.
            Telling them of my happiness.
            What the lightening of happiness has told me.
            I will spread it to each of them.
            """),
        Idos(name: "发黄的照片",
             image: UIImage(named: "3.png")!,
             shortDescription: "愿你有一个灿烂的前程",
             description: """
            给每一条河每一座山取一个温暖的名字
            陌生人，我也为你祝福
            愿你有一个灿烂的前程
            愿你有情人终成眷属
            愿你在尘世获得幸福
            我只愿面朝大海，春暖花开
            """),
        Idos(name: "粉白女孩",
             image: UIImage(named: "4.png")!,
             shortDescription: "City in British Columbia",
             description: "Vancouver, a bustling west coast seaport in British Columbia, is among Canada’s densest, most ethnically diverse cities. A popular filming location, it’s surrounded by mountains, and also has thriving art, theatre and music scenes. Vancouver Art Gallery is known for its works by regional artists, while the Museum of Anthropology houses preeminent First Nations collections."),
        Idos(name: "樱桃小丸子",
             image: UIImage(named: "5.png")!,
             shortDescription: "City in Ontario",
             description: "Toronto, the capital of the province of Ontario, is a major Canadian city along Lake Ontario’s northwestern shore. It's a dynamic metropolis with a core of soaring skyscrapers, all dwarfed by the iconic CN Tower. Toronto also has many green spaces, from the orderly oval of Queen’s Park to 400-acre High Park and its trails, sports facilities and zoo."),
        ]
    static let shared = IdosStore()
    func getIdosFromModel(handle: ([Idos]) -> Void){
        handle(idos)
    }
}
