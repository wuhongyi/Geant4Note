<!-- G4HadronElasticProcess.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 五 8月 10 06:50:59 2018 (+0800)
;; Last-Updated: 五 8月 10 06:51:38 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4HadronElasticProcess

**public G4HadronicProcess**

General process for hadron nuclear elastic scattering

## class

```cpp
public:

  G4HadronElasticProcess(const G4String& procName = "hadElastic");

  virtual ~G4HadronElasticProcess();
 
  virtual G4VParticleChange* PostStepDoIt(const G4Track& aTrack, 
					  const G4Step& aStep);

  // initialise thresholds
  virtual void PreparePhysicsTable(const G4ParticleDefinition&);

  // set internal limit
  virtual void SetLowestEnergy(G4double);

  // obsolete method - will be removed
  virtual void SetLowestEnergyNeutron(G4double);

  virtual void ProcessDescription(std::ostream& outFile) const;

  // enable sampling of low-mass diffraction process
  void SetDiffraction(G4HadronicInteraction*, G4VCrossSectionRatio*);

private:

  // hide assignment operator as private 
  G4HadronElasticProcess& operator=(const G4HadronElasticProcess &right);
  G4HadronElasticProcess(const G4HadronElasticProcess& );

  G4double lowestEnergy;
  G4bool   isInitialised;
  G4HadronicInteraction* fDiffraction;
  G4VCrossSectionRatio*  fDiffractionRatio;
```

<!-- G4HadronElasticProcess.md ends here -->
