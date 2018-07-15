<!-- G4eBremsstrahlungRelModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 08:15:14 2018 (+0800)
;; Last-Updated: 日 7月 15 08:17:42 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4eBremsstrahlungRelModel

**public G4VEmModel**

Implementation of energy loss for gamma emission by electrons and positrons including an improved version of the LPM effect

## class

```cpp
public:

  explicit G4eBremsstrahlungRelModel(const G4ParticleDefinition* p = 0, 
				     const G4String& nam = "eBremLPM");

  virtual ~G4eBremsstrahlungRelModel();

  virtual void Initialise(const G4ParticleDefinition*, const G4DataVector&) override;

  virtual void InitialiseLocal(const G4ParticleDefinition*,
			       G4VEmModel* masterModel) override;

  virtual G4double ComputeDEDXPerVolume(const G4Material*,
					const G4ParticleDefinition*,
					G4double kineticEnergy,
					G4double cutEnergy) override;
					
  virtual G4double ComputeCrossSectionPerAtom(const G4ParticleDefinition*,
					      G4double tkin, 
					      G4double Z,   G4double,
					      G4double cutEnergy,
					      G4double maxEnergy = DBL_MAX) override;
  
  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double cutEnergy,
				 G4double maxEnergy) override;

  virtual void SetupForMaterial(const G4ParticleDefinition*,
                                const G4Material*,G4double) override;

  virtual G4double MinPrimaryEnergy(const G4Material*,
				    const G4ParticleDefinition*,
				    G4double cut) override;

  inline void SetLPMconstant(G4double val);
  inline G4double LPMconstant() const;

  inline void SetLowestKinEnergy(G4double);
  inline G4double LowestKinEnergy() const;


protected:

  virtual G4double ComputeDXSectionPerAtom(G4double gammaEnergy);

  // * fast inline functions *
  inline void SetCurrentElement(G4int);

private:

  void InitialiseConstants();

  void CalcLPMFunctions(G4double gammaEnergy);

  G4double ComputeBremLoss(G4double cutEnergy);

  G4double ComputeXSectionPerAtom(G4double cutEnergy);

  G4double ComputeRelDXSectionPerAtom(G4double gammaEnergy);

  void SetParticle(const G4ParticleDefinition* p);

  inline G4double Phi1(G4double,G4double);
  inline G4double Phi1M2(G4double,G4double);
  inline G4double Psi1(G4double,G4double);
  inline G4double Psi1M2(G4double,G4double);

  // hide assignment operator
  G4eBremsstrahlungRelModel & operator=(const  G4eBremsstrahlungRelModel &right) = delete;
  G4eBremsstrahlungRelModel(const  G4eBremsstrahlungRelModel&) = delete;
```

<!-- G4eBremsstrahlungRelModel.md ends here -->
