/// A copy/paste of the root level data.json with cycles removed
final data = {
  "humans": [
    {
      "id": "1000",
      "name": "Luke Skywalker",
      "friends": ["1002", "1003", "2000", "2001"],
      "appearsIn": ["NEWHOPE", "EMPIRE", "JEDI"],
      "homePlanet": "Tatooine",
      "height": 1.72,
      "mass": 77.0,
      "starships": ["3001", "3003"]
    },
    {
      "id": "1001",
      "name": "Darth Vader",
      "friends": ["1004"],
      "appearsIn": ["NEWHOPE", "EMPIRE", "JEDI"],
      "homePlanet": "Tatooine",
      "height": 2.02,
      "mass": 136.0,
      "starships": ["3002"]
    },
    {
      "id": "1002",
      "name": "Han Solo",
      // "friends": ["1000", "1003", "2001"],
      "appearsIn": ["NEWHOPE", "EMPIRE", "JEDI"],
      "height": 1.8,
      "mass": 80.0,
      "starships": ["3000", "3003"]
    },
    {
      "id": "1003",
      "name": "Leia Organa",
      // "friends": ["1000", "1002", "2000", "2001"],
      "appearsIn": ["NEWHOPE", "EMPIRE", "JEDI"],
      "homePlanet": "Alderaan",
      "height": 1.5,
      "mass": 49.0,
      "starships": <void>[]
    },
    {
      "id": "1004",
      "name": "Wilhuff Tarkin",
      // "friends": ["1001"],
      "appearsIn": ["NEWHOPE"],
      "height": 1.8,
      "mass": null,
      "starships": <void>[]
    }
  ],
  "droids": [
    {
      "id": "2000",
      "name": "C-3PO",
      "friends": [/*"1000", "1002",*/ "1003", "2001"],
      "appearsIn": ["NEWHOPE", "EMPIRE", "JEDI"],
      "primaryFunction": "Protocol"
    },
    {
      "id": "2001",
      "name": "R2-D2",
      // "friends": ["1000", "1002", "1003"],
      "appearsIn": ["NEWHOPE", "EMPIRE", "JEDI"],
      "primaryFunction": "Astromech"
    }
  ],
  "starships": [
    {"id": "3000", "name": "Millenium Falcon", "length": 34.37},
    {"id": "3001", "name": "X-Wing", "length": 12.5},
    {"id": "3002", "name": "TIE Advanced x1", "length": 9.2},
    {"id": "3003", "name": "Imperial shuttle", "length": 20.0}
  ]
};
