<!-- G4IonCoulombScatteringModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 07:16:10 2018 (+0800)
;; Last-Updated: 日 7月 15 07:17:15 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4IonCoulombScatteringModel

**public G4VEmModel**

Single Scattering Model for protons, alpha and heavy Ions

## class

```cpp
public:

  explicit G4IonCoulombScatteringModel(const G4String& nam = 
				       "IonCoulombScattering");
 
  virtual ~G4IonCoulombScatteringModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) final;
 
  virtual G4double ComputeCrossSectionPerAtom(
                                const G4ParticleDefinition*,
				G4double kinEnergy, 
				G4double Z, 
				G4double A, 
				G4double cut,
				G4double emax) final;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) final;


  	
  inline void  SetRecoilThreshold(G4double eth);

  inline void  SetHeavyIonCorr(G4int b);

  inline G4int GetHeavyIonCorr();

  //protected: 
	 
private:

  inline void DefineMaterial(const G4MaterialCutsCouple*);
  
  inline void SetupParticle(const G4ParticleDefinition*);

  // hide assignment operator
  G4IonCoulombScatteringModel & operator=
  (const G4IonCoulombScatteringModel &right) = delete;
  G4IonCoulombScatteringModel(const  G4IonCoulombScatteringModel&) = delete;
```

<!-- G4IonCoulombScatteringModel.md ends here -->
