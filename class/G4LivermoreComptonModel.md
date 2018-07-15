<!-- G4LivermoreComptonModel.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 日 7月 15 05:52:14 2018 (+0800)
;; Last-Updated: 日 7月 15 05:55:19 2018 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 1
;; URL: http://wuhongyi.cn -->

# G4LivermoreComptonModel

**public G4VEmModel**

- G4ShellData
	- "/doppler/shell-doppler"
- G4DopplerProfile
- "/livermore/comp/ce-cs-x.dat"


## class

```cpp
public:

  G4LivermoreComptonModel(const G4ParticleDefinition* p = 0, 
		          const G4String& nam = "LivermoreCompton");

  virtual ~G4LivermoreComptonModel();

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

  G4LivermoreComptonModel & operator=(const  G4LivermoreComptonModel &right);
  G4LivermoreComptonModel(const  G4LivermoreComptonModel&);
```

<!-- G4LivermoreComptonModel.md ends here -->
