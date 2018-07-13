<!-- G4BetheBlochModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 7月 13 03:59:49 2018 (+0800)
;; Last-Updated: 六 7月 14 02:47:14 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4BetheBlochModel

**public G4VEmModel**

Implementation of Bethe-Bloch model of energy loss and delta-electron production by heavy charged particles

Energy > 2 MeV

## class

```cpp
public:

  explicit G4BetheBlochModel(const G4ParticleDefinition* p = nullptr,
			     const G4String& nam = "BetheBloch");

  virtual ~G4BetheBlochModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;

  virtual G4double MinEnergyCut(const G4ParticleDefinition*,
				const G4MaterialCutsCouple* couple) override;

  virtual G4double ComputeCrossSectionPerElectron(
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double cutEnergy,
				 G4double maxEnergy);
				 
  virtual G4double ComputeCrossSectionPerAtom(
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double Z, G4double A,
				 G4double cutEnergy,
				 G4double maxEnergy) override;
				 				 
  virtual G4double CrossSectionPerVolume(const G4Material*,
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double cutEnergy,
				 G4double maxEnergy) override;
				 
  virtual G4double ComputeDEDXPerVolume(const G4Material*,
					const G4ParticleDefinition*,
					G4double kineticEnergy,
					G4double cutEnergy) override;

  virtual G4double GetChargeSquareRatio(const G4ParticleDefinition* p,
					const G4Material* mat,
					G4double kineticEnergy) override;

  virtual G4double GetParticleCharge(const G4ParticleDefinition* p,
				     const G4Material* mat,
				     G4double kineticEnergy) override;

  virtual void CorrectionsAlongStep(const G4MaterialCutsCouple* couple,
				    const G4DynamicParticle* dp,
				    G4double& eloss,
				    G4double&,
				    G4double length) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;

protected:

  virtual G4double MaxSecondaryEnergy(const G4ParticleDefinition*,
				      G4double kinEnergy) override;

  inline G4double GetChargeSquareRatio() const;

  inline void SetChargeSquareRatio(G4double val);

private:

  void SetupParameters();

  inline void SetParticle(const G4ParticleDefinition* p);

  inline void SetGenericIon(const G4ParticleDefinition* p);

  // hide assignment operator
  G4BetheBlochModel & operator=(const  G4BetheBlochModel &right) = delete;
  G4BetheBlochModel(const  G4BetheBlochModel&) = delete;
```



<!-- G4BetheBlochModel.md ends here -->
