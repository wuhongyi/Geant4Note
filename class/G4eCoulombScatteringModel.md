<!-- G4eCoulombScatteringModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 07:12:36 2018 (+0800)
;; Last-Updated: 日 7月 15 07:14:46 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4eCoulombScatteringModel

**public G4VEmModel**

Implementation of eCoulombScattering of a charge particle on Atomic Nucleus for interval of scattering anles in Lab system thetaMin - ThetaMax.

## class

```cpp
public:

  explicit G4eCoulombScatteringModel(G4bool combined = true);
 
  virtual ~G4eCoulombScatteringModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;

  virtual void InitialiseLocal(const G4ParticleDefinition*, 
                               G4VEmModel* masterModel) override;

  virtual G4double ComputeCrossSectionPerAtom(
                                const G4ParticleDefinition*,
				G4double kinEnergy, 
				G4double Z, 
				G4double A, 
				G4double cut,
				G4double emax) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;

  virtual G4double MinPrimaryEnergy(const G4Material*,
				    const G4ParticleDefinition*,
				    G4double) final;

  // defines low energy limit of the model
  inline void SetLowEnergyThreshold(G4double val);

  // user definition of low-energy threshold of recoil
  inline void SetRecoilThreshold(G4double eth);

  // defines low energy limit on energy transfer to atomic electron
  inline void SetFixedCut(G4double);

  // low energy limit on energy transfer to atomic electron
  inline G4double GetFixedCut() const;

protected:

  inline void DefineMaterial(const G4MaterialCutsCouple*);

  inline void SetupParticle(const G4ParticleDefinition*);

private:

  // hide assignment operator
  G4eCoulombScatteringModel & operator=
  (const G4eCoulombScatteringModel &right) = delete;
  G4eCoulombScatteringModel(const  G4eCoulombScatteringModel&) = delete;
```

<!-- G4eCoulombScatteringModel.md ends here -->
