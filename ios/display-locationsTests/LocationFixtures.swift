//
//  location_fixtures.swift
//  display-locationsTests
//
//  Created by Nathan Perry on 9/29/24.
//

import Foundation

class LocationFixtures {
    static func sampleResponseData() -> Data {
        return sampleJSON().data(using: .utf8)!
    }

    static func sampleJSON() -> String {
        return """
        [
            {
                "id": 1,
                "latitude": 37.7750,
                "longitude": -122.4195,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "restaurant"
                    },
                    {
                        "type": "name",
                        "value": "Golden Gate Grill"
                    },
                    {
                        "type": "description",
                        "value": "A popular eatery with views of the bay."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 10.5
                    }
                ]
            },
            {
                "id": 2,
                "latitude": 37.7745,
                "longitude": -122.4189,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "museum"
                    },
                    {
                        "type": "name",
                        "value": "San Francisco Museum of Modern Art"
                    },
                    {
                        "type": "description",
                        "value": "Contemporary art exhibits."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 5.0
                    }
                ]
            },
            {
                "id": 3,
                "latitude": 37.7752,
                "longitude": -122.4198,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "park"
                    },
                    {
                        "type": "name",
                        "value": "Yerba Buena Gardens"
                    },
                    {
                        "type": "description",
                        "value": "Urban park with sculptures and waterfalls."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 8.0
                    }
                ]
            },
            {
                "id": 4,
                "latitude": 37.7740,
                "longitude": -122.4200,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "landmark"
                    },
                    {
                        "type": "name",
                        "value": "Transamerica Pyramid"
                    },
                    {
                        "type": "description",
                        "value": "Iconic skyscraper in the Financial District."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 12.3
                    }
                ]
            },
            {
                "id": 5,
                "latitude": 37.7748,
                "longitude": -122.4185,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "cafe"
                    },
                    {
                        "type": "name",
                        "value": "Union Square Cafe"
                    },
                    {
                        "type": "description",
                        "value": "Cozy cafe in the heart of downtown."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 3.7
                    }
                ]
            },
            {
                "id": 6,
                "latitude": 37.7760,
                "longitude": -122.4170,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "bar"
                    },
                    {
                        "type": "name",
                        "value": "The Tipsy Albatross"
                    },
                    {
                        "type": "description",
                        "value": "Lively bar with craft beers."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 6.2
                    }
                ]
            },
            {
                "id": 7,
                "latitude": 37.7735,
                "longitude": -122.4215,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "cafe"
                    },
                    {
                        "type": "name",
                        "value": "Cafe Roma"
                    },
                    {
                        "type": "description",
                        "value": "Cozy cafe with Italian pastries."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 2.5
                    }
                ]
            },
            {
                "id": 8,
                "latitude": 37.7770,
                "longitude": -122.4188,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "cafe"
                    },
                    {
                        "type": "name",
                        "value": "Sweet Treats Bakery"
                    },
                    {
                        "type": "description",
                        "value": "Fresh pastries and coffee."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 2.0
                    }
                ]
            },
            {
                "id": 9,
                "latitude": 37.7759,
                "longitude": -122.4182,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "museum"
                    },
                    {
                        "type": "name",
                        "value": "Metreon Science Center"
                    },
                    {
                        "type": "description",
                        "value": "Interactive science exhibits."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 5.7
                    }
                ]
            },
            {
                "id": 10,
                "latitude": 37.7722,
                "longitude": -122.4199,
                "attributes": [
                    {
                        "type": "location_type",
                        "value": "park"
                    },
                    {
                        "type": "name",
                        "value": "Mission Dolores Park"
                    },
                    {
                        "type": "description",
                        "value": "Popular park with city views."
                    },
                    {
                        "type": "estimated_revenue_millions",
                        "value": 11.0
                    }
                ]
            }
        ]
        """
    }
}
