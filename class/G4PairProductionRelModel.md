<!-- G4PairProductionRelModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 05:00:43 2018 (+0800)
;; Last-Updated: 日 7月 15 05:01:48 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4PairProductionRelModel

**public G4VEmModel**

Implementation of gamma convertion to e+e- in the field of a nucleus relativistic approximation

## class

```cpp
public:

  explicit G4PairProductionRelModel(const G4ParticleDefinition* p = nullptr, 
				    const G4String& nam = "BetheHeitlerLPM");
 
  virtual ~G4PairProductionRelModel();

  virtual void Initialise(const G4ParticleDefinition*, 
			  const G4DataVector&) override;

  virtual void InitialiseLocal(const G4ParticleDefinition*, 
			       G4VEmModel* masterModel) override;

  virtual G4double ComputeCrossSectionPerAtom(
                                const G4ParticleDefinition*,
                                      G4double kinEnergy, 
                                      G4double Z, 
                                      G4double A=0., 
                                      G4double cut=0.,
                                      G4double emax=DBL_MAX) override;

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double maxEnergy) override;

  virtual void SetupForMaterial(const G4ParticleDefinition*,
                                const G4Material*,G4double) override;

  // * fast inline functions *
  inline void SetCurrentElement(G4double Z);

  // set / get methods
  inline void SetLPMconstant(G4double val);
  inline G4double LPMconstant() const;

  inline void SetLPMflag(G4bool);
  inline G4bool LPMflag() const;

protected:

  // screening functions
  inline G4double Phi1(G4double delta) const;
  inline G4double Phi2(G4double delta) const;
  inline G4double ScreenFunction1(G4double ScreenVariable);
  inline G4double ScreenFunction2(G4double ScreenVariable);
  inline G4double DeltaMax() const;
  inline G4double DeltaMin(G4double) const;

  // lpm functions
  void  CalcLPMFunctions(G4double k, G4double eplus);

  G4double ComputeXSectionPerAtom(G4double totalEnergy, G4double Z);

  G4double ComputeDXSectionPerAtom(G4double eplusEnergy, G4double totalEnergy, G4double Z);
  G4double ComputeRelDXSectionPerAtom(G4double eplusEnergy, G4double totalEnergy, G4double Z);

  // hide assignment operator
  G4PairProductionRelModel & operator=
  (const G4PairProductionRelModel &right) = delete;
  G4PairProductionRelModel(const  G4PairProductionRelModel&) = delete;
```

<!-- G4PairProductionRelModel.md ends here -->
