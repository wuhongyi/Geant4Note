<!-- G4NucleiModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 二 9月  4 03:30:36 2018 (+0800)
;; Last-Updated: 二 9月  4 06:02:43 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 3
;; URL: http://wuhongyi.cn -->

# G4NucleiModel


**模型**

```cpp
  void generateParticleFate(G4CascadParticle& cparticle,
			    G4ElementaryParticleCollider* theEPCollider,
			    std::vector<G4CascadParticle>& cascade); 
```


```
// For the best approximation to a physical-units model, set the following:
//	setenv G4NUCMODEL_XSEC_SCALE   0.1
//	setenv G4NUCMODEL_RAD_SCALE    1.0
//	setenv G4NUCMODEL_RAD_2PAR     1
//	setenv G4NUCMODEL_RAD_SMALL    1.992
//	setenv G4NUCMODEL_RAD_ALPHA    0.84
//	setenv G4NUCMODEL_FERMI_SCALE  0.685
//	setenv G4NUCMODEL_RAD_TRAILING 0.70
```


- G4CascadeParameters
- G4CascadeChannelTables


## class

```cpp
public:
  G4NucleiModel();
  G4NucleiModel(G4int a, G4int z);
  explicit G4NucleiModel(G4InuclNuclei* nuclei);

  virtual ~G4NucleiModel();

  void setVerboseLevel(G4int verbose) { verboseLevel = verbose; }

  void generateModel(G4InuclNuclei* nuclei);
  void generateModel(G4int a, G4int z);

  // Arguments here are used for rescattering (::Propagate)
  void reset(G4int nHitNeutrons=0, G4int nHitProtons=0,
	     const std::vector<G4ThreeVector>* hitPoints=0);

  void printModel() const; 

  G4double getDensity(G4int ip, G4int izone) const {
    return nucleon_densities[ip - 1][izone];
  }

  G4double getFermiMomentum(G4int ip, G4int izone) const {
    return fermi_momenta[ip - 1][izone];
  }

  G4double getFermiKinetic(G4int ip, G4int izone) const;

  G4double getPotential(G4int ip, G4int izone) const {
    if (ip == 9 || ip < 0) return 0.0;		// Photons and leptons
    G4int ip0 = ip < 3 ? ip - 1 : 2;
    if (ip > 10 && ip < 18) ip0 = 3;
    if (ip > 20) ip0 = 4;
    return izone < number_of_zones ? zone_potentials[ip0][izone] : 0.0;
  }

  // Factor to convert GEANT4 lengths to internal units
  G4double getRadiusUnits() const { return radiusUnits*CLHEP::fermi; }

  G4double getRadius() const { return nuclei_radius; }
  G4double getRadius(G4int izone) const {
    return ( (izone<0) ? 0.
	     : (izone<number_of_zones) ? zone_radii[izone] : nuclei_radius);
  }
  G4double getVolume(G4int izone) const {
    return ( (izone<0) ? 0.
	     : (izone<number_of_zones) ? zone_volumes[izone] : nuclei_volume);
  }

  G4int getNumberOfZones() const { return number_of_zones; }
  G4int getZone(G4double r) const {
    for (G4int iz=0; iz<number_of_zones; iz++) if (r<zone_radii[iz]) return iz;
    return number_of_zones;
  }

  G4int getNumberOfNeutrons() const { return neutronNumberCurrent; }
  G4int getNumberOfProtons() const  { return protonNumberCurrent; }

  G4bool empty() const { 
    return neutronNumberCurrent < 1 && protonNumberCurrent < 1; 
  }

  G4bool stillInside(const G4CascadParticle& cparticle) {
    return cparticle.getCurrentZone() < number_of_zones;
  }


  G4CascadParticle initializeCascad(G4InuclElementaryParticle* particle);

  typedef std::pair<std::vector<G4CascadParticle>, std::vector<G4InuclElementaryParticle> > modelLists;

  void initializeCascad(G4InuclNuclei* bullet, G4InuclNuclei* target,
			modelLists& output);


  std::pair<G4int, G4int> getTypesOfNucleonsInvolved() const {
    return std::pair<G4int, G4int>(current_nucl1, current_nucl2);
  }

  void generateParticleFate(G4CascadParticle& cparticle,
			    G4ElementaryParticleCollider* theEPCollider,
			    std::vector<G4CascadParticle>& cascade); 

  G4bool forceFirst(const G4CascadParticle& cparticle) const;
  G4bool isProjectile(const G4CascadParticle& cparticle) const;
  G4bool worthToPropagate(const G4CascadParticle& cparticle) const; 
    
  G4InuclElementaryParticle generateNucleon(G4int type, G4int zone) const;

  G4LorentzVector generateNucleonMomentum(G4int type, G4int zone) const;

  G4double absorptionCrossSection(G4double e, G4int type) const;
  G4double totalCrossSection(G4double ke, G4int rtype) const;

  // Identify whether given particle can interact with dibaryons
  static G4bool useQuasiDeuteron(G4int ptype, G4int qdtype=0);

protected:
  G4bool passFermi(const std::vector<G4InuclElementaryParticle>& particles, 
		   G4int zone);

  G4bool passTrailing(const G4ThreeVector& hit_position);

  void boundaryTransition(G4CascadParticle& cparticle);

  void choosePointAlongTraj(G4CascadParticle& cparticle);

  G4InuclElementaryParticle generateQuasiDeuteron(G4int type1, 
						  G4int type2,
						  G4int zone) const;

  typedef std::pair<G4InuclElementaryParticle, G4double> partner;

  std::vector<partner> thePartners;		// Buffer for output below
  void generateInteractionPartners(G4CascadParticle& cparticle);

  // Function for std::sort() to use in organizing partners by path length
  static G4bool sortPartners(const partner& p1, const partner& p2) {
    return (p2.second > p1.second);
  }

  // Functions used to generate model nuclear structure
  void fillBindingEnergies();

  void fillZoneRadii(G4double nuclearRadius);

  G4double fillZoneVolumes(G4double nuclearRadius);

  void fillPotentials(G4int type, G4double tot_vol);

  G4double zoneIntegralWoodsSaxon(G4double ur1, G4double ur2,
				  G4double nuclearRadius) const;

  G4double zoneIntegralGaussian(G4double ur1, G4double ur2,
				G4double nuclearRadius) const; 

  G4double getRatio(G4int ip) const;	// Fraction of nucleons still available

  // Scale nuclear density with interactions so far
  G4double getCurrentDensity(G4int ip, G4int izone) const;

  // Average path length for any interaction of projectile and target
  //	= 1. / (density * cross-section)
  G4double inverseMeanFreePath(const G4CascadParticle& cparticle,
			       const G4InuclElementaryParticle& target,
			       G4int zone = -1);	// Override zone value
  // NOTE:  Function is non-const in order to use dummy_converter

  // Use path-length and MFP (above) to throw random distance to collision
  G4double generateInteractionLength(const G4CascadParticle& cparticle,
				     G4double path, G4double invmfp) const;

private:
  G4int verboseLevel;

  // Buffers for processing interactions on each cycle
  G4LorentzConvertor dummy_convertor;	// For getting collision frame
  G4CollisionOutput EPCoutput;		// For N-body inelastic collisions

  std::vector<G4InuclElementaryParticle> qdeutrons;	// For h+(NN) trials
  std::vector<G4double> acsecs;
    
  std::vector<G4ThreeVector> coordinates;	// for initializeCascad()
  std::vector<G4LorentzVector> momentums;
  std::vector<G4InuclElementaryParticle> raw_particles;

  std::vector<G4ThreeVector> collisionPts;

  // Temporary buffers for computing nuclear model
  G4double ur[7];		// Number of skin depths for each zone
  G4double v[6];		// Density integrals by zone
  G4double v1[6];		// Pseudo-volume (delta r^3) by zone
  std::vector<G4double> rod;	// Nucleon density
  std::vector<G4double> pf;	// Fermi momentum
  std::vector<G4double> vz;	// Nucleon potential

  // Nuclear model configuration
  std::vector<std::vector<G4double> > nucleon_densities;
  std::vector<std::vector<G4double> > zone_potentials;
  std::vector<std::vector<G4double> > fermi_momenta;
  std::vector<G4double> zone_radii;
  std::vector<G4double> zone_volumes;
  std::vector<G4double> binding_energies;
  G4double nuclei_radius;
  G4double nuclei_volume;
  G4int number_of_zones;

  G4int A;
  G4int Z;
  G4InuclNuclei* theNucleus;

  G4int neutronNumber;
  G4int protonNumber;

  G4int neutronNumberCurrent;
  G4int protonNumberCurrent;

  G4int current_nucl1;
  G4int current_nucl2;

  G4CascadeInterpolator<30> gammaQDinterp;	// quasideuteron interpolator

  // Symbolic names for nuclear potentials
  enum PotentialType { WoodsSaxon=0, Gaussian=1 };

  // Parameters for nuclear structure
  const G4double crossSectionUnits;	// Scale from internal to natural units
  const G4double radiusUnits;
  const G4double skinDepth;		// Fraction of radius for outer skin
  const G4double radiusScale;		// Coefficients for two-parameter fit
  const G4double radiusScale2;		//   R = 1.16*cbrt(A) - 1.3456/cbrt(A)
  const G4double radiusForSmall; 	// Average radius of light A<5 nuclei
  const G4double radScaleAlpha;		// Scaling factor R_alpha/R_small
  const G4double fermiMomentum;
  const G4double R_nucleon;
  const G4double gammaQDscale;		// Gamma/cluster scattering rescaling

  // Cutoffs for extreme values
  static const G4double small;
  static const G4double large;
  static const G4double piTimes4thirds;  // FIXME:  We should not be using this!

  static const G4double alfa3[3], alfa6[6];	// Zone boundaries in radii
  static const G4double pion_vp;		// Flat potentials for pi, K, Y
  static const G4double pion_vp_small;
  static const G4double kaon_vp;
  static const G4double hyperon_vp;

  // Neutrons and protons, for computing trajectory placements
  const G4InuclElementaryParticle neutronEP;
  const G4InuclElementaryParticle protonEP;
```

<!-- G4NucleiModel.md ends here -->
