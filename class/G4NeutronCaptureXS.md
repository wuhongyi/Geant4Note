<!-- G4NeutronCaptureXS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:56:01 2018 (+0800)
;; Last-Updated: 五 8月 10 07:57:04 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4NeutronCaptureXS

**public G4VCrossSectionDataSet**

This is a base class for neutron radiative capture cross section based on data files from G4NEUTRONXSDATA data set 

## class

```cpp
const G4int MAXZCAPTURE = 93;
```

```cpp
public: // With Description

  G4NeutronCaptureXS();

  virtual ~G4NeutronCaptureXS();
    
  static const char* Default_Name() {return "G4NeutronCaptureXS";}

  virtual
  G4bool IsElementApplicable(const G4DynamicParticle*, G4int Z,
			     const G4Material*);

  virtual
  G4bool IsIsoApplicable(const G4DynamicParticle*, G4int Z, G4int A,
			 const G4Element*, const G4Material*);

  virtual
  G4double GetElementCrossSection(const G4DynamicParticle*, 
				  G4int Z, const G4Material* mat=0);
  
  virtual
  G4double GetIsoCrossSection(const G4DynamicParticle*, G4int Z, G4int A,
                              const G4Isotope* iso,
                              const G4Element* elm,
                              const G4Material* mat);

  virtual G4Isotope* SelectIsotope(const G4Element*, G4double kinEnergy);

  virtual
  void BuildPhysicsTable(const G4ParticleDefinition&);

  virtual void CrossSectionDescription(std::ostream&) const;

private: 

  void Initialise(G4int Z, const char* = 0);

  G4PhysicsVector* RetrieveVector(std::ostringstream& in, G4bool warn);

  G4double IsoCrossSection(G4double ekin, G4int Z, G4int A);

  G4NeutronCaptureXS & operator=(const G4NeutronCaptureXS &right);
  G4NeutronCaptureXS(const G4NeutronCaptureXS&);

  G4double emax;
  G4double elimit;

  G4bool   isMaster;

  static G4ElementData* data;
  std::vector<G4double> temp;

  static const G4int amin[MAXZCAPTURE];
  static const G4int amax[MAXZCAPTURE];
```

<!-- G4NeutronCaptureXS.md ends here -->
