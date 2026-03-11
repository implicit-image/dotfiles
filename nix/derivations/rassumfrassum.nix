{ lib, pythonPackages, fetchPypi }:

pythonPackages.buildPythonPackage rec {
  pname = "rassumfrassum";
  version = "0.3.3";
  pyproject = true;
  build-system = [ pythonPackages.setuptools ];
#  format = "wheel";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Gs2Qgwafj9m1tdVcw1k4UXTbxgbS5awTCINBkb5HIhc=";  # Get this from PyPI
  };

  # Optional: add dependencies
  propagatedBuildInputs = [
    # other python packages
  ];

  # Optional: disable tests
  doCheck = false;

  meta = with lib; {
    description = "LSP multiplexer";
    homepage = "https://pypi.org/project/${pname}/";
  };
}
