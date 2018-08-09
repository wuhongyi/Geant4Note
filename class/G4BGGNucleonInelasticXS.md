<!-- G4BGGNucleonInelasticXS.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 07:18:27 2018 (+0800)
;; Last-Updated: 五 8月 10 07:19:23 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4BGGNucleonInelasticXS

**public G4VCrossSectionDataSet**

Wrapper of proton and neutron inelastic cross-sections using Barashenkov parametersation below 100 GeV and Glauber-Gribov model above

## class

```cpp
public:

  G4BGGNucleonInelasticXS (const G4ParticleDefinition*);

  virtual ~G4BGGNucleonInelasticXS();
   
  virtual
  G4bool IsElementApplicable(const G4DynamicParticle*, G4int Z,
			     const G4Material* mat = 0);

  virtual
  G4bool IsIsoApplicable(const G4DynamicParticle*, G4int Z, G4int A,  
			 const G4Element* elm = 0,
			 const G4Material* mat = 0);

  virtual
  G4double GetElementCrossSection(const G4DynamicParticle*, G4int Z,
				  const G4Material* mat = 0);

  virtual
  G4double GetIsoCrossSection(const G4DynamicParticle*, G4int Z, G4int A,  
			      const G4Isotope* iso = 0,
			      const G4Element* elm = 0,
			      const G4Material* mat = 0);

  virtual
  void BuildPhysicsTable(const G4ParticleDefinition&);

  virtual void CrossSectionDescription(std::ostream&) const;

  inline void SetLowestCrossSection(G4double val);

private:

  G4double CoulombFactor(G4double kinEnergy, G4int Z);

  G4BGGNucleonInelasticXS & operator=(const G4BGGNucleonInelasticXS &right);
  G4BGGNucleonInelasticXS(const G4BGGNucleonInelasticXS&);

  G4double fGlauberEnergy;  
  G4double fLowEnergy;  
  G4double fHighEnergy;  
  G4double fSAIDHighEnergyLimit;
  G4double fLowestXSection;
  G4double theGlauberFac[93];
  G4double theCoulombFac[93];
  G4int    theA[93];

  const G4ParticleDefinition*     particle;
  const G4ParticleDefinition*     theProton;

  G4ComponentGGHadronNucleusXsc*  fGlauber;
  G4NucleonNuclearCrossSection*   fNucleon;
  G4HadronNucleonXsc*             fHadron;
  G4ComponentSAIDTotalXS*         fSAID;
  G4bool                          isProton;
  G4bool                          isInitialized;
```

<!-- G4BGGNucleonInelasticXS.md ends here -->
