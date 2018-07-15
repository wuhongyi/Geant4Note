<!-- G4VMscModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 06:57:02 2018 (+0800)
;; Last-Updated: 日 7月 15 06:59:04 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4VMscModel

**public G4VEmModel**

General interface to msc models

##  class

```cpp
public:

  explicit G4VMscModel(const G4String& nam);

  virtual ~G4VMscModel();

  virtual G4double ComputeTruePathLengthLimit(const G4Track& track,  
					      G4double& stepLimit);

  virtual G4double ComputeGeomPathLength(G4double truePathLength);

  virtual G4double ComputeTrueStepLength(G4double geomPathLength);

  virtual G4ThreeVector& SampleScattering(const G4ThreeVector&,
					  G4double safety);

  // empty method
  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
				 const G4MaterialCutsCouple*,
				 const G4DynamicParticle*,
				 G4double tmin,
				 G4double tmax) override;

  //================================================================
  //  Set parameters of multiple scattering models
  //================================================================
 
  inline void SetStepLimitType(G4MscStepLimitType);

  inline void SetLateralDisplasmentFlag(G4bool val);

  inline void SetRangeFactor(G4double);

  inline void SetGeomFactor(G4double);

  inline void SetSkin(G4double);

  inline void SetSampleZ(G4bool);

  //================================================================
  //  Get/Set access to Physics Tables
  //================================================================

  inline G4VEnergyLossProcess* GetIonisation() const;

  inline void SetIonisation(G4VEnergyLossProcess*, 
			    const G4ParticleDefinition* part);

  //================================================================
  //  Run time methods
  //================================================================

protected:

  // initialisation of the ParticleChange for the model
  // initialisation of interface with geometry and ionisation 
  G4ParticleChangeForMSC* 
  GetParticleChangeForMSC(const G4ParticleDefinition* p = nullptr);

  // convert true length to geometry length
  inline G4double ConvertTrueToGeom(G4double& tLength, G4double& gLength);

public:

  // compute safety
  inline G4double ComputeSafety(const G4ThreeVector& position, 
				G4double limit= DBL_MAX);

  // compute linear distance to a geometry boundary
  inline G4double ComputeGeomLimit(const G4Track&, G4double& presafety, 
				   G4double limit);

  inline G4double GetDEDX(const G4ParticleDefinition* part,
			  G4double kineticEnergy,
			  const G4MaterialCutsCouple* couple);

  inline G4double GetRange(const G4ParticleDefinition* part,
                           G4double kineticEnergy,
			   const G4MaterialCutsCouple* couple);

  inline G4double GetEnergy(const G4ParticleDefinition* part,
			    G4double range,
			    const G4MaterialCutsCouple* couple);

  // G4MaterialCutsCouple should be defined before call to this method
  inline 
  G4double GetTransportMeanFreePath(const G4ParticleDefinition* part,
				    G4double kinEnergy);

private:

  //  hide assignment operator
  G4VMscModel & operator=(const  G4VMscModel &right) = delete;
  G4VMscModel(const  G4VMscModel&) = delete;
```


<!-- G4VMscModel.md ends here -->
