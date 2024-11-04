//
//  courseList.swift
//  TeeOff
//
//  Created by Dylan Zarn on 2024-11-03.
//

import Foundation

// St. Boniface Golf Course

let sbgcHoles: [hole] = [
    hole(id: 1, par: 4, blues: 357, whites: 340, reds: 320),
    hole(id: 2, par: 4, blues: 365, whites: 255, reds: 292),
    hole(id: 3, par: 4, blues: 379, whites: 368, reds: 320),
    hole(id: 4, par: 4, blues: 379, whites: 361, reds: 346),
    hole(id: 5, par: 3, blues: 163, whites: 145, reds: 127),
    hole(id: 6, par: 4, blues: 332, whites: 326, reds: 317),
    hole(id: 7, par: 4, blues: 282, whites: 271, reds: 256),
    hole(id: 8, par: 4, blues: 366, whites: 355, reds: 339),
    hole(id: 9, par: 5, blues: 520, whites: 497, reds: 444),
    hole(id: 10, par: 4, blues: 441, whites: 430, reds: 418),
    hole(id: 11, par: 4, blues: 483, whites: 471, reds: 461),
    hole(id: 12, par: 3, blues: 220, whites: 206, reds: 223),
    hole(id: 13, par: 5, blues: 516, whites: 496, reds: 476),
    hole(id: 14, par: 3, blues: 205, whites: 185, reds: 165),
    hole(id: 15, par: 4, blues: 330, whites: 316, reds: 301),
    hole(id: 16, par: 4, blues: 325, whites: 319, reds: 325),
    hole(id: 17, par: 5, blues: 516, whites: 504, reds: 448),
    hole(id: 18, par: 3, blues: 169, whites: 159, reds: 154)]

let StB: course = course(
    id: "St. Boniface GC",
    address: "100 Rue Youville, Winnipeg, MB",
    blues: 6348,
    whites: 6104,
    reds: 5719,
    par: 72,
    holes: sbgcHoles)

// Southside Golf Course

let southsideHoles: [hole] = [
    hole(id: 1, par: 4, blues: 408, whites: 376, reds: 352),
    hole(id: 2, par: 3, blues: 113, whites: 102, reds: 90),
    hole(id: 3, par: 3, blues: 199, whites: 170, reds: 158),
    hole(id: 4, par: 4, blues: 390, whites: 347, reds: 336),
    hole(id: 5, par: 4, blues: 332, whites: 296, reds: 282),
    hole(id: 6, par: 3, blues: 170, whites: 145, reds: 134),
    hole(id: 7, par: 3, blues: 142, whites: 124, reds: 105),
    hole(id: 8, par: 4, blues: 350, whites: 312, reds: 286),
    hole(id: 9, par: 3, blues: 130, whites: 104, reds: 100),
    hole(id: 10, par: 4, blues: 376, whites: 353, reds: 293),
    hole(id: 11, par: 3, blues: 173, whites: 150, reds: 141),
    hole(id: 12, par: 3, blues: 138, whites: 115, reds: 100),
    hole(id: 13, par: 4, blues: 341, whites: 326, reds: 319),
    hole(id: 14, par: 3, blues: 166, whites: 142, reds: 120),
    hole(id: 15, par: 3, blues: 132, whites: 110, reds: 88),
    hole(id: 16, par: 4, blues: 383, whites: 345, reds: 324),
    hole(id: 17, par: 5, blues: 536, whites: 486, reds: 442),
    hole(id: 18, par: 3, blues: 217, whites: 187, reds: 156)]

let Southside: course = course(
    id: "Southside Golf Course",
    address: "2226 Southside Road, Grande Pointe, MB",
    blues: 4696,
    whites: 4190,
    reds: 3806,
    par: 63,
    holes: southsideHoles)

//Maplewood Golf Club

let maplewoodHoles: [hole] = [
    hole(id: 1, par: 4, blues: 350, whites: 339, reds: 315),
    hole(id: 2, par: 4, blues: 309, whites: 300, reds: 280),
    hole(id: 3, par: 4, blues: 309, whites: 300, reds: 284),
    hole(id: 4, par: 5, blues: 295, whites: 262, reds: 249),
    hole(id: 5, par: 3, blues: 175, whites: 154, reds: 135),
    hole(id: 6, par: 4, blues: 385, whites: 370, reds: 270),
    hole(id: 7, par: 3, blues: 161, whites: 145, reds: 128),
    hole(id: 8, par: 4, blues: 325, whites: 302, reds: 247),
    hole(id: 9, par: 4, blues: 388, whites: 348, reds: 303),
    hole(id: 10, par: 5, blues: 469, whites: 444, reds: 399),
    hole(id: 11, par: 4, blues: 300, whites: 280, reds: 164),
    hole(id: 12, par: 4, blues: 414, whites: 379, reds: 315),
    hole(id: 13, par: 3, blues: 220, whites: 175, reds: 125),
    hole(id: 14, par: 4, blues: 347, whites: 327, reds: 257),
    hole(id: 15, par: 5, blues: 449, whites: 434, reds: 399),
    hole(id: 16, par: 4, blues: 292, whites: 282, reds: 234),
    hole(id: 17, par: 4, blues: 379, whites: 339, reds: 304),
    hole(id: 18, par: 3, blues: 164, whites: 150, reds: 125)]

         
let Maplewood: course = course(
    id: "Maplewood Golf Club",
    address: "19113 Cure Road, St-Pierre-Jolys, MB",
    blues: 5731,
    whites: 5330,
    reds: 4533,
    par: 70,
    holes: maplewoodHoles)

let courseList: [course] = [StB, Southside, Maplewood]
