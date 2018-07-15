<!-- G4WentzelVIModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 07:03:46 2018 (+0800)
;; Last-Updated: 日 7月 15 07:04:49 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4WentzelVIModel

**public G4VMscModel**


## class

```cpp
public:

  explicit G4WentzelVIModel(G4bool comb=true, const G4String& nam = "WentzelVIUni");

  virtual ~G4WentzelVIModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;

  virtual void InitialiseLocal(const G4ParticleDefinition*, 
                               G4VEmModel* masterModel) override;

  virtual void StartTracking(G4Track*) override;

  virtual G4double ComputeCrossSectionPerAtom(const G4ParticleDefinition*,
					      G4double KineticEnergy,
					      G4double AtomicNumber,
					      G4double AtomicWeight=0., 
					      G4double cut = DBL_MAX,
					      G4double emax= DBL_MAX) override;

  virtual G4ThreeVector& SampleScattering(const G4ThreeVector&, 
					  G4double safety) override;

  virtual G4double 
  ComputeTruePathLengthLimit(const G4Track& track,
			     G4double& currentMinimalStep) override;

  virtual G4double ComputeGeomPathLength(G4double truePathLength) override;

  virtual G4double ComputeTrueStepLength(G4double geomStepLength) override;

  // defines low energy limit on energy transfer to atomic electron
  inline void SetFixedCut(G4double);

  // low energy limit on energy transfer to atomic electron
  inline G4double GetFixedCut() const;

  // access to cross section class
  inline void SetWVICrossSection(G4WentzelOKandVIxSection*);

  inline G4WentzelOKandVIxSection* GetWVICrossSection();

  inline void SetUseSecondMoment(G4bool);

  inline G4bool UseSecondMoment() const;

  inline G4PhysicsTable* GetSecondMomentTable();

  inline G4double SecondMoment(const G4ParticleDefinition*,
			       const G4MaterialCutsCouple*,
			       G4double kineticEnergy);

  void SetSingleScatteringFactor(G4double);

  void DefineMaterial(const G4MaterialCutsCouple*);

protected:

  G4double ComputeTransportXSectionPerVolume(G4double cosTheta);

  inline void SetupParticle(const G4ParticleDefinition*);

private:

  G4double ComputeSecondMoment(const G4ParticleDefinition*,
			       G4double kineticEnergy);

  //  hide assignment operator
  G4WentzelVIModel & operator=(const  G4WentzelVIModel &right) = delete;
  G4WentzelVIModel(const  G4WentzelVIModel&) = delete;
```

<!-- G4WentzelVIModel.md ends here -->
