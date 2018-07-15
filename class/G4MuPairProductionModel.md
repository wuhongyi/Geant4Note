<!-- G4MuPairProductionModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 08:29:12 2018 (+0800)
;; Last-Updated: 日 7月 15 08:31:45 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 2
;; URL: http://wuhongyi.cn -->

# G4MuPairProductionModel

**public G4VEmModel**

Implementation of e+e- pair production by muons

- G4ElementData



## class

```cpp
public:

  explicit G4MuPairProductionModel(const G4ParticleDefinition* p = nullptr,
                                   const G4String& nam = "muPairProd");

  virtual ~G4MuPairProductionModel();

  virtual void Initialise(const G4ParticleDefinition*, 
                          const G4DataVector&) override;

  virtual void InitialiseLocal(const G4ParticleDefinition*,
			       G4VEmModel* masterModel) override;
			
  virtual G4double ComputeCrossSectionPerAtom(
				 const G4ParticleDefinition*,
				 G4double kineticEnergy,
				 G4double Z, G4double A,
				 G4double cutEnergy,
				 G4double maxEnergy) override;
				 
  virtual G4double ComputeDEDXPerVolume(const G4Material*,
                                const G4ParticleDefinition*,
                                G4double kineticEnergy,
                                G4double cutEnergy) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*, 
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;

  virtual G4double MinPrimaryEnergy(const G4Material*,
                                    const G4ParticleDefinition*,
                                    G4double) override;

  inline void SetLowestKineticEnergy(G4double e);

  inline void SetParticle(const G4ParticleDefinition*);

protected:

  G4double ComputMuPairLoss(G4double Z, G4double tkin, G4double cut,
                            G4double tmax);

  G4double ComputeMicroscopicCrossSection(G4double tkin,
                                          G4double Z,
                                          G4double cut);

  virtual G4double 
  ComputeDMicroscopicCrossSection(G4double tkin, G4double Z,
				  G4double pairEnergy);

  inline G4double MaxSecondaryEnergyForElement(G4double kineticEnergy,
					       G4double Z);

private:

  void MakeSamplingTables();

  void DataCorrupted(G4int Z, G4double logTkin);

  inline G4double FindScaledEnergy(G4int Z, G4double rand, G4double logTkin,
				   G4double yymin, G4double yymax); 

  // hide assignment operator
  G4MuPairProductionModel & operator=(const G4MuPairProductionModel &right) = delete;
  G4MuPairProductionModel(const  G4MuPairProductionModel&) = delete;
```

<!-- G4MuPairProductionModel.md ends here -->
