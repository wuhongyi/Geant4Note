<!-- G4UrbanMscModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 08:45:16 2018 (+0800)
;; Last-Updated: 日 7月 15 08:47:31 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4UrbanMscModel

**public G4VMscModel**

Implementation of the model of multiple scattering based on H.W.Lewis Phys Rev 78 (1950) 526 and L.Urban model

In its present form the model can be  used for simulation of the e-/e+ multiple scattering

## class

```cpp
public:

  explicit G4UrbanMscModel(const G4String& nam = "UrbanMsc");

  virtual ~G4UrbanMscModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;

  virtual void StartTracking(G4Track*) override;

  virtual G4double 
  ComputeCrossSectionPerAtom(const G4ParticleDefinition* particle,
			     G4double KineticEnergy,
			     G4double AtomicNumber,
			     G4double AtomicWeight=0., 
			     G4double cut =0.,
			     G4double emax=DBL_MAX) override;

  virtual G4ThreeVector& SampleScattering(const G4ThreeVector&, 
					  G4double safety) override;

  virtual G4double 
  ComputeTruePathLengthLimit(const G4Track& track,
			     G4double& currentMinimalStep) override;

  virtual G4double ComputeGeomPathLength(G4double truePathLength) override;

  virtual G4double ComputeTrueStepLength(G4double geomStepLength) override;

  G4double ComputeTheta0(G4double truePathLength, G4double KineticEnergy);

private:

  G4double SampleCosineTheta(G4double trueStepLength, G4double KineticEnergy);

  void SampleDisplacement(G4double sinTheta, G4double phi);

  void SampleDisplacementNew(G4double sinTheta, G4double phi);

  inline void SetParticle(const G4ParticleDefinition*);

  inline void UpdateCache();

  inline G4double Randomizetlimit();
  
  inline G4double SimpleScattering(G4double xmeanth, G4double x2meanth);

  //  hide assignment operator
  G4UrbanMscModel & operator=(const  G4UrbanMscModel &right) = delete;
  G4UrbanMscModel(const  G4UrbanMscModel&) = delete;
```

<!-- G4UrbanMscModel.md ends here -->
