﻿using System.Xml.Serialization;

namespace CarDealer.Dtos.Export
{
    public class SalesWithDiscountCarDto
    {
        [XmlAttribute("make")]
        public string Make { get; set; }

        [XmlAttribute("model")]
        public string Model { get; set; }

        [XmlAttribute("travelled-distance")]
        public long TravelledDistance { get; set; }
    }
}