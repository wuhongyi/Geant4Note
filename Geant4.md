<!-- Geant4.md --- 
;; 
;; Description: 
;; Author: Hongyi Wu(吴鸿毅)
;; Email: wuhongyi@qq.com 
;; Created: 六 11月 19 08:59:31 2016 (+0800)
;; Last-Updated: 五 7月 16 22:07:11 2021 (+0800)
;;           By: Hongyi Wu(吴鸿毅)
;;     Update #: 25
;; URL: http://wuhongyi.cn -->

# 修改源代码

## RadioactiveDecay

支持类型

- IT   (isomeric transition)
- BetaMinus
- BetaPlus
- KshellEC
- MshellEC
- LshellEC
- Alpha
- SpFission


想要模拟放射性衰变，需要先确认 **source/processes/decay/include/G4DecayProcessType.hh** 中调用数据库的核子数范围，如果超出范围，需要修改源代码。


G4RadioactiveDecayBase.hh 用来实现具体的衰变


## PhotonEvaporation

G4没有添加的，如果要自己添加，需要先确认 **G4NuclearLevelData.cc** 中调用数据库的核子数范围，如若超出该范围，需要修改其源代码。然后在数据库添加相应的数据文件。如果数据库中没有该文件或者超出数据库定义的核子数范围，应该是采用经验公式计算。 

----

## G4ParticleHPNames

getenv("NeutronHPNames")
getenv("AllowForHeavyElements")
getenv("NeutronHPNamesLogging")
getenv("G4NEUTRONHPDATA")



G4ParticleHPNames::GetName(G4int A, G4int Z, G4int M, G4String base, G4String rest, G4bool & aFlag)  
- HPWD 1 (CrossSection): 判断该核素截面数据文件是否存在
  - HPWD 2 : 如果HPWD 1 不存在，则判断是否存在 nat 文件
  - HPWD 3 : 如果HPWD 2 存在，则将其做SetNaturalAbundanceFlag()标记
- HPWD 4a (CrossSection): 如果HPWD 1 存在
- HPWD 4b1 (rest != "/CrossSection"): 如果HPWD 1 存在，该核素 rest类型文件存在
- HPWD 4b2a : 如果HPWD 1 存在，该核素 rest类型文件存在 nat 文件
- HPWD 4b2c : 如果HPWD 1 存在，该核素 不存在 rest类型文件
- 如果不存在，则寻找接近的核素

- 结束以上寻找之后给出 Names::GetName: last theName proposal = 建议值来。

## G4ParticleHPManager


if ( getenv( "G4NEUTRONHP_DO_NOT_ADJUST_FINAL_STATE" ) || getenv("G4PHP_DO_NOT_ADJUST_FINAL_STATE") ) DO_NOT_ADJUST_FINAL_STATE = true;
if ( getenv( "G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION" ) ) USE_ONLY_PHOTONEVAPORATION = true;
if ( getenv( "G4NEUTRONHP_NEGLECT_DOPPLER" ) || getenv("G4PHP_NEGLECT_DOPPLER") ) NEGLECT_DOPPLER = true;
if ( getenv( "G4NEUTRONHP_SKIP_MISSING_ISOTOPES" ) ) SKIP_MISSING_ISOTOPES = true;
if ( getenv( "G4NEUTRONHP_PRODUCE_FISSION_FRAGMENTS" ) ) PRODUCE_FISSION_FRAGMENTS = true;

G4ParticleHPManager::GetDataStream 中优先级别
- Use the compressed file 
- Use regular text file
- found no data file,set error bit to the stream

G4ParticleHPManager::GetDataStream2 判断数据文件是否存在


## G4ParticleHPChannel

getenv("G4NEUTRON_HP_USE_WENDT_FISSION_MODEL")

计算末态

## G4ParticleHPChannelList

define G4PHPDEBUG
getenv("G4ParticleHPDebug")



## G4ParticleHPFinalState

getenv( "G4PHP_DO_NOT_ADJUST_FINAL_STATE" )


## G4ParticleHPElasticFS

G4int repFlag;    // Legendre coeff(1), or probability array(2), or isotropic(0).
                  // add 3: for Legendre (Low Energy) + Probability (High Energy)
G4double targetMass; // in neutronmass units.
G4int frameFlag;  // CMS or Lab system.  1=LAB, 2=CMS



## G4ParticleHPInelastic

getenv("G4PARTICLEHPDATA")
getenv("G4PHPTEST")


define G4PHPDEBUG
getenv("G4ParticleHPDebug")


F01-F36

## G4ParticleHPInelasticData

getenv( "G4PARTICLEHPDATA" )


## G4ParticleHPInelasticBaseFS

getenv( "G4PHP_DO_NOT_ADJUST_FINAL_STATE" )
getenv("G4PHPTEST")


define G4PHPDEBUG
getenv("G4ParticleHPDebug")
getenv("G4ParticleHPDebug_NamesLogging")

## G4ParticleHPInelasticCompFS

define G4PHPDEBUG
getenv("G4ParticleHPDebug")


## G4ParticleHPCapture

getenv("NeutronHPCapture")
getenv("G4NEUTRONHPDATA")

## G4ParticleHPCaptureData

getenv("CaptureDataIndexDebug")


## G4ParticleHPFission

getenv("G4NEUTRONHPDATA")


----

DEBUG mode define in cmake

- G4ParticleHPInelasticBaseFS G4PHPDEBUG

----

## 修改源码

source/processes/hadronic/cross_sections/src/G4ElectroNuclearCrossSection.cc 中函数 G4int G4ElectroNuclearCrossSection::GetFunctions(G4double a, G4double* xx, G4double* yy, G4double* zz) 限制了质量数 a>238.49



## 在 .bashrc或者geant4.sh 最后添加以下内容

```shell

export NeutronHPNames=1
export NeutronHPNamesLogging=1
export G4ParticleHPDebug=1
export G4ParticleHPDebug_NamesLogging=1
export NeutronHPCapture=1
export CaptureDataIndexDebug=1
export G4PHPTEST=1

# export G4NEUTRONHP_USE_ONLY_PHOTONEVAPORATION=1
# export G4NEUTRONHP_NEGLECT_DOPPLER=1
##忽略多普勒效应
# export G4PHP_NEGLECT_DOPPLER=1
# export G4NEUTRONHP_PRODUCE_FISSION_FRAGMENTS=1
# export G4NEUTRON_HP_USE_WENDT_FISSION_MODEL=1


## It sets to zero the cross section of the isotopes which are not present in the neutron library. If GEANT4 doesn’t find an isotope, then it looks for the natural composition data of that element. Only if the element is not found then the cross section is set to zero. On the contrary, if this variable is not defined, GEANT4 looks then for the neutron data of another isotope close in Z and A, which will have completely different nuclear properties and lead to incorrect results (highly recommended).
# export G4NEUTRONHP_SKIP_MISSING_ISOTOPES=1

## Activates the physics for isotopes with Z>92 (recommended).
export AllowForHeavyElements=1

## If this variable is not defined, a GEANT4 model that attempts to satisfy the energy and momentum conservation in some nuclear reactions, by generating artificial gamma rays. By setting such a variable one avoids the correction and leads to the result obtained with the ENDF-6 libraries. Even though energy and momentum conservation are desirable, the ENDF-6 libraries do not provide the necessary correlations between secondary particles for satisfying them in all cases. On the contrary, ENDF-6 libraries intrinsically violate energy and momentum conservation for several processes and have been built for preserving the overall average quantities such as average energy releases, average number of secondaries... (highly recommended).
# export G4NEUTRONHP_DO_NOT_ADJUST_FINAL_STATE=1


# export DO_NOT_SET_PHP_AS_HP=1
# export G4PHP_DO_NOT_ADJUST_FINAL_STATE=1
```


----

## Cross-sections for low-energy charged particle transport

The cross-section data for low-energy charged particle transport are organized in a set of files that are read at initialization, similarly to the case of low-energy neutron transport. The “root” directory of the cross-section directory structure is accessed through an environment variable, G4PARTICLEHPDATA, which has to be set by the user. This variable has to point to the directory where the low-energy charged particle data have been installed, e.g. G4TENDL1.3 for the Geant4 release 10.3 (note that the download of this data library from the Geant4 web site is not done automatically, i.e. it must be done manually by the user):

export G4PARTICLEHPDATA=/your/path/G4TENDL1.3/.

It is expected that the directory $G4PARTICLEHPDATA has the following five subdirectories, corresponding to the charged particles that can be handled by the low-energy charged particle transport: Proton/, Deuteron/, Triton/, He3/, Alpha/. It is possible for the user to overwrite the default directory structure with individual environment variables pointing to custom data libraries for each particle type. This is considered an advanced/expert user feature. These directories are set by the following environment variables: G4PROTONHPDATA, for proton; G4DEUTERONHPDATA, for deuteron; G4TRITONHPDATA, for triton; G4HE3HPDATA, for He3; G4ALPHAHPDATA, for alpha. Note that if any of these variables is not defined explicitly, e.g. G4TRITONHPDATA, then the corresponding data library is expected to be a subdirectory of $G4PARTICLEHPDATA/, e.g. $G4PARTICLEHPDATA/Triton/. If instead all the above five environmental variables are set, then G4PARTICLEHPDATA does not need to be specified; even if it is set, then its value will be ignored (because the per-particle ones take precedence).



----

## 一些有用工具

g4tools  https://softinex.lal.in2p3.fr/

https://softinex.lal.in2p3.fr/inexlib/1.8.0_1/index.html

LLNL fission  https://nuclear.llnl.gov/simulation/


<!-- Geant4.md ends here -->
