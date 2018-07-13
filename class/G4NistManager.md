<!-- G4NistManager.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 7月 13 04:14:06 2018 (+0800)
;; Last-Updated: 六 7月 14 02:39:36 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4NistManager

Element data from the NIST DB on Atomic Weights and Isotope Compositions
> http://physics.nist.gov/PhysRefData/Compositions/index.html

## class 

```cpp
public:

  static G4NistManager* Instance();
  ~G4NistManager();

  // Get G4Element by index
  //
  inline G4Element* GetElement(size_t index) const;
  
  // Find or build G4Element by atomic number
  //
  inline G4Element* FindElement(G4int Z) const;
  inline G4Element* FindOrBuildElement(G4int Z, G4bool isotopes=true);
  
  // Find or build G4Element by symbol
  //
  inline G4Element* FindOrBuildElement(const G4String& symb, 
				       G4bool isotopes=true);

  // Get number of elements
  //
  inline size_t GetNumberOfElements() const;

  // Get atomic number by element symbol
  //
  inline G4int GetZ(const G4String& symb) const;

  // Get atomic weight by element symbol - mean mass in units of amu of 
  // an atom with electron shell for the natural isotope composition 
  //
  inline G4double GetAtomicMassAmu(const G4String& symb) const;

  // Get atomic weight in atomic units - mean mass in units of amu of an atom 
  // with electron shell for the natural isotope composition 
  //
  inline G4double GetAtomicMassAmu(G4int Z) const;

  // Get mass of isotope without electron shell in Geant4 energy units 
  //
  inline G4double GetIsotopeMass(G4int Z, G4int N) const;

  // Get mass in Geant4 energy units of an atom of a particular isotope 
  // with the electron shell  
  //
  inline G4double GetAtomicMass(G4int Z, G4int N) const;

  // Get total ionisation energy of an atom
  //
  inline G4double GetTotalElectronBindingEnergy(G4int Z) const;

  // Get N for the first natural isotope
  //
  inline G4int GetNistFirstIsotopeN(G4int Z) const;

  // Get number of natural isotopes
  //
  inline G4int GetNumberOfNistIsotopes(G4int Z) const;

  // Get natural isotope abundance
  //
  inline G4double GetIsotopeAbundance(G4int Z, G4int N) const;

  // Print element by Z
  //
  inline void PrintElement(G4int Z) const;

  // Print element from internal DB by symbol, if "all" - print all elements
  //
  void PrintElement(const G4String&) const;

  // Print G4Element by name, if "all" - print all G4Elements
  //
  void PrintG4Element(const G4String&) const;  

  // Access to the vector of Geant4 predefined element names 
  //
  inline const std::vector<G4String>& GetNistElementNames() const;

  // Access mean ionisation energy for atoms (Z <= 98) by its index 
  // 
  inline G4double GetMeanIonisationEnergy(G4int Z) const;

  // Access nominal density by atomic number for simple materials and 
  // by the index for other NIST materials 
  //
  inline G4double GetNominalDensity(G4int Z) const;

  // Get G4Material by index 
  //
  inline G4Material* GetMaterial(size_t index) const;
  
  // Find or build a G4Material by name, from the Geant4 dataBase
  //
  inline G4Material* FindMaterial(const G4String& name) const; 
  inline G4Material* FindOrBuildMaterial(const G4String& name, 
					 G4bool isotopes=true,
					 G4bool warning=false);

  // Find or build a simple material via atomic number
  //
  inline G4Material* FindSimpleMaterial(G4int Z) const; 
  inline G4Material* FindOrBuildSimpleMaterial(G4int Z, 
					       G4bool warning=false);
  
  // Build G4Material with user defined name and density on base
  // of a material from Geant4 dataBase
  //
  G4Material* BuildMaterialWithNewDensity(const G4String& name,
                                          const G4String& basename, 
					  G4double density = 0.0,
					  G4double temp = NTP_Temperature,  
					  G4double pres = CLHEP::STP_Pressure);  

  // Construct a G4Material from scratch by atome count
  // 
  inline G4Material* ConstructNewMaterial(
			          const G4String& name,
				  const std::vector<G4String>& elm,
				  const std::vector<G4int>& nbAtoms,
				  G4double dens, 
				  G4bool isotopes=true,
				  G4State   state    = kStateSolid,     
				  G4double  temp     = NTP_Temperature,  
				  G4double  pressure = CLHEP::STP_Pressure); 

  // Construct a G4Material from scratch by fraction mass
  // 
  inline G4Material* ConstructNewMaterial(
				  const G4String& name,
				  const std::vector<G4String>& elm,
				  const std::vector<G4double>& weight,
				  G4double dens, 
				  G4bool isotopes=true,
				  G4State   state    = kStateSolid,     
				  G4double  temp     = NTP_Temperature,  
				  G4double  pressure = CLHEP::STP_Pressure); 

  // Construct a gas G4Material from scratch by atome count
  // 
  inline G4Material* ConstructNewGasMaterial(const G4String& name,
					     const G4String& nameNist,
					     G4double temp, 
					     G4double pres, 
					     G4bool isotopes=true);

  // Construct an ideal gas G4Material from scratch by atom count
  //
  inline G4Material* ConstructNewIdealGasMaterial(
                                  const G4String& name,
                                  const std::vector<G4String>& elm,
                                  const std::vector<G4int>& nbAtoms,
                                  G4bool isotopes    = true,
                                  G4double  temp     = NTP_Temperature,
                                  G4double  pressure = CLHEP::STP_Pressure);
				      
  // Get number of G4Materials
  //
  inline size_t GetNumberOfMaterials() const;
  
  inline G4int GetVerbose() const;

  void SetVerbose(G4int);

  // Print G4Material by name
  //
  void PrintG4Material(const G4String&) const;

  // Print predefined Geant4 materials:
  // "simple" - only pure materials in basic state (Z = 1, ..., 98)
  // "compound" - NIST compounds
  // "hep" - HEP materials and compounds
  // "bio" - bio-medical materials and compounds
  // "all" - all
  //
  inline void ListMaterials(const G4String&) const;

  // Access to the list of names of Geant4 predefined materials
  //
  inline const std::vector<G4String>& GetNistMaterialNames() const;

  // Fast computation of Z^1/3
  //
  inline G4double GetZ13(G4double Z) const;
  inline G4double GetZ13(G4int Z) const;

  // Fast computation of A^0.27 for natuaral abundances
  //
  inline G4double GetA27(G4int Z) const;

  // Fast computation of log(A)
  //
  inline G4double GetLOGZ(G4int Z) const;
  inline G4double GetLOGAMU(G4int Z) const;

private:

  explicit G4NistManager();
  static G4NistManager* instance;
```


<!-- G4NistManager.md ends here -->
