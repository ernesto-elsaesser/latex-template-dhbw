#!/bin/sh

MGR='sudo tlmgr'

$MGR update --self
$MGR install texfot setspace geometry caption enumitem footmisc listings hyperref xurl apalike-german glossaries natbib ulem
