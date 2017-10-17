################################################################################
#
#  Program: 3D Slicer
#
#  Copyright (c) Kitware Inc.
#
#  See COPYRIGHT.txt
#  or http://www.slicer.org/copyright/copyright.txt for details.
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#  This file was originally developed by Jean-Christophe Fillion-Robin, Kitware Inc.
#  and was partially funded by NIH grant 1U24CA194354-01
#
################################################################################

function(ExternalProject_AlwaysConfigure proj)
  # This custom external project step forces the configure and later
  # steps to run.
  _ep_get_step_stampfile(${proj} "configure" stampfile)
  ExternalProject_Add_Step(${proj} forceconfigure
    COMMAND ${CMAKE_COMMAND} -E remove ${stampfile}
    COMMENT "Forcing configure step for '${proj}'"
    DEPENDEES build
    ALWAYS 1
    )
endfunction()
