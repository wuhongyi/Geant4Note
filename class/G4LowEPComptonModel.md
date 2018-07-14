<!-- G4LowEPComptonModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 7月 14 12:33:29 2018 (+0800)
;; Last-Updated: 六 7月 14 12:39:48 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4LowEPComptonModel

**public G4VEmModel**

```cpp
// | The following is a Geant4 class to simulate the process of        |
// | bound electron Compton scattering. General code structure is      |
// | based on G4LowEnergyCompton.cc and G4LivermoreComptonModel.cc.    |
// | Algorithms for photon energy, and ejected Compton electron        |
// | direction taken from:                                             |
// |                                                                   |
// | J. M. C. Brown, M. R. Dimmock, J. E. Gillam and D. M. Paganin,    |
// | "A low energy bound atomic electron Compton scattering model      |
// |  for Geant4", NIMB, Vol. 338, 77-88, 2014.                        |
// |                                                                   |
// | The author acknowledges the work of the Geant4 collaboration      |
// | in developing the following algorithms that have been employed    |
// | or adapeted for the present software:                             |    
// |                                                                   |
// |  # sampling of photon scattering angle,                           |
// |  # target element selection in composite materials,               |
// |  # target shell selection in element,                             |
// |  # and sampling of bound electron momentum from Compton profiles. |
// |                                                                   |
```


- /livermore/comp/ce-cs-x.dat"
- G4ShellData
	- "/doppler/shell-doppler"
- G4DopplerProfile


## class

```cpp
public:

  G4LowEPComptonModel(const G4ParticleDefinition* p = 0, 
		          const G4String& nam = "LowEPComptonModel");
  
  virtual ~G4LowEPComptonModel();

  virtual void Initialise(const G4ParticleDefinition*, const G4DataVector&);

  virtual void InitialiseLocal(const G4ParticleDefinition*,
                               G4VEmModel* masterModel);

  virtual void InitialiseForElement(const G4ParticleDefinition*, G4int Z);

  virtual G4double ComputeCrossSectionPerAtom( const G4ParticleDefinition*,
                                               G4double kinEnergy,
                                               G4double Z,
                                               G4double A=0,
                                               G4double cut=0,
                                               G4double emax=DBL_MAX );

  virtual void SampleSecondaries(std::vector<G4DynamicParticle*>*,
                                 const G4MaterialCutsCouple*,
                                 const G4DynamicParticle*,
                                 G4double tmin,
                                 G4double maxEnergy);

private:

  void ReadData(size_t Z, const char* path = 0);

  G4double ComputeScatteringFunction(G4double x, G4int Z);

  G4LowEPComptonModel & operator=(const  G4LowEPComptonModel &right);
  G4LowEPComptonModel(const  G4LowEPComptonModel&);
```

<!-- G4LowEPComptonModel.md ends here -->
