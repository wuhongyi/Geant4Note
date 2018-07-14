<!-- G4VIonDEDXTable.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 07:34:20 2018 (+0800)
;; Last-Updated: 六 7月 14 07:35:15 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VIonDEDXTable

Base class for electronic stopping power tables for ions.

## class

```cpp
 public:
   explicit G4VIonDEDXTable(); 
   virtual ~G4VIonDEDXTable();  

   // Function for building a stopping power table for a material consisting of
   // a single element only.
   virtual G4bool BuildPhysicsVector(
        G4int,  // Atomic number of ion
        G4int   // Atomic number of elemental material
                               ) = 0;

   // Function building stopping power table for a given ion-material pair.
   virtual G4bool BuildPhysicsVector(
        G4int,           // Atomic number of ion
        const G4String&  // Name or chemical formula of material
                               ) = 0;

   // Function for checking the availability of stopping power tables
   // for a given ion-material pair, where the material consists of
   // a single element only.
   virtual G4bool IsApplicable(
        G4int,  // Atomic number of ion
        G4int   // Atomic number of elemental material
                               ) = 0;

   // Function for checking the availability of stopping power tables
   // for a given ion-material pair.
   virtual G4bool IsApplicable(
        G4int,           // Atomic number of ion
        const G4String&  // Name or chemical formula of material
                               ) = 0;

   // Function returning the stopping power vector for a given ion-material
   // pair, where the material consists of a single element only (the 
   // physics vector returned by this function must contain the kinetic 
   // energy per nucleon vs the mass stopping power of the elemental material). 
   virtual G4PhysicsVector* GetPhysicsVector(
	G4int,    // Atomic number of ion
        G4int     // Atomic number of elemental material
					     ) = 0;

   // Function returning the stopping power vector for given ion-material
   // pair (the physics vector returned by this function must contain the 
   // kinetic energy per nucleon vs the mass stopping power of the material). 
   virtual G4PhysicsVector* GetPhysicsVector(
	G4int,           // Atomic number of ion
        const G4String&  // Name or chemical formula of material
					     ) = 0;

private:

  G4VIonDEDXTable(G4VIonDEDXTable&) = delete;
  const G4VIonDEDXTable & operator=(const G4VIonDEDXTable&) = delete;
```


<!-- G4VIonDEDXTable.md ends here -->
