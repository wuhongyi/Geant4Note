<!-- G4IonStoppingData.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 07:36:55 2018 (+0800)
;; Last-Updated: 六 7月 14 07:39:39 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4IonStoppingData

**public G4VIonDEDXTable**

Class which can read ion stopping power data from $G4LEDATA/ion_stopping_data

```
ionization (ion_stopping_data/icru73):
 
   zZZ_MAT.dat       = mass stopping powers from ICRU 73 tables and revised
                       tables provided by P. Sigmund/Univ. of Southern Denmark
                       (revised tables are: G4_WATER (all considered ions), 
                       G4_WATER_VAPOR (all considered ions), G4NYLON-6-6
                       (F ions), G4_Cu (all considered ions))

                       File name definition:
                         * Elemental targets: zZZ_YY.dat
                                               ZZ = ion atomic number
                                               YY = atomic number of material
                         * Compound materials: zZZ_NAME.dat
                                               ZZ = ion atomic number
                                               YY = material name 

                       File content:
                         Format readable by G4LPhysicsFreeVector, data in
                         ICRU 73 units:
                           1st column: Energy per nucleon in MeV
                           2nd column: Mass stopping power in MeV*cm2/(mg)
```


## class

```cpp
 public:
   G4IonStoppingData(const G4String& leDirectory);
   virtual ~G4IonStoppingData();

   // Function for checking the availability of stopping power tables
   // for a given ion-material couple, where the material consists of
   // a single element only.
   G4bool IsApplicable(
        G4int atomicNumberIon,          // Atomic number of ion
        G4int atomicNumberElem          // Atomic number of elemental material
                       );

   // Function for checking the availability of stopping power tables
   // for given ion-material couples.
   G4bool IsApplicable(
        G4int atomicNumberIon,          // Atomic number of ion
        const G4String& matIdentifier   // Name or chemical formula of material
                       );

   // Function which invokes the read/build process of physics vectors from
   // files in G4LEDATA
   G4bool BuildPhysicsVector(G4int ionZ, 
                             const G4String& matName);

   // Function which invokes the read/build process of physics vectors from
   // files in G4LEDATA
   G4bool BuildPhysicsVector(G4int ionZ, 
                             G4int matZ);

   // Function returning the stopping power vector for given ion-material
   // couples, where the material consists of a single element only.
   G4PhysicsVector* GetPhysicsVector(
	G4int atomicNumberIon,          // Atomic number of ion
        G4int atomicNumberElem          // Atomic number of elemental material
				     );

   // Function returning the stopping power vector for given ion-material
   // couples.
   G4PhysicsVector* GetPhysicsVector(
	G4int atomicNumberIon,          // Atomic number of ion
        const G4String& matIdenfier     // Name or chemical formula of material
				     );

   // Function returning the stopping power value for given ion-material
   // couples, where the material consists of a single element only, and
   // given energy.
   G4double GetDEDX(
        G4double kinEnergyPerNucleon,   // Kinetic energy per nucleon
        G4int atomicNumberIon,          // Atomic number of ion
        G4int atomicNumberElem          // Atomic number of elemental material
				     );

   // Function returning the stopping power value for given ion-material
   // couples and given energy.
   G4double GetDEDX(
        G4double kinEnergyPerNucleon,   // Kinetic energy per nucleon
	G4int atomicNumberIon,          // Atomic number of ion
        const G4String& matIdentifier   // Name or chemical formula of material
				     );

   // Function for adding dE/dx vector for an elemental materials. The last
   // argument only applies to elemental materials.
   G4bool AddPhysicsVector(
        G4PhysicsVector* physicsVector, // Physics vector
	G4int atomicNumberIon,          // Atomic number of ion
        const G4String& matIdentifier   // Name or chemical formula of material
  			   );

   // Function for adding dE/dx vector for an elemental materials. The last
   // argument only applies to elemental materials.
   G4bool AddPhysicsVector(
        G4PhysicsVector* physicsVector, // Physics vector
	G4int atomicNumberIon,          // Atomic number of ion
        G4int atomicNumberElem          // Atomic number of elemental material
			 );

   // Function for removing dE/dx vector for a compound materials
   G4bool RemovePhysicsVector(
	G4int atomicNumberIon,          // Atomic number of ion
        const G4String& matIdentifier   // Name or chemical formula of material
			    );
   // Function for removing dE/dx vector for a compound materials
   G4bool RemovePhysicsVector(
	G4int atomicNumberIon,          // Atomic number of ion
        G4int atomicNumberElem          // Atomic number of elemental material
			    );
   // Function deleting all physics vectors and clearing the maps
   void ClearTable();

   // Function printing the ion-material pairs of available vectors to stdout
   void DumpMap();

 private:

   G4IonStoppingData(G4IonStoppingData&) = delete;
   const G4IonStoppingData & operator=(const G4IonStoppingData&) = delete;
```


<!-- G4IonStoppingData.md ends here -->
