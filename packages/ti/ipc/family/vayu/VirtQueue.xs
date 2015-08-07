/*
 * Copyright (c) 2015 Texas Instruments Incorporated - http://www.ti.com
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 *  ======== VirtQueue.xs ========
 */

/*
 *  ======== module$use ========
 *  Use other modules required by this module
 */
function module$use()
{
    xdc.useModule('ti.ipc.remoteproc.Resource');
    xdc.loadPackage('ti.pm');
    xdc.useModule('ti.sdo.utils.MultiProc');

    xdc.useModule('ti.sysbios.hal.Cache');
    xdc.useModule('ti.sysbios.hal.Hwi');
    xdc.useModule('ti.sysbios.gates.GateHwi');
    xdc.useModule('ti.sysbios.knl.Clock');

    xdc.useModule('xdc.runtime.Assert');
    xdc.useModule('xdc.runtime.Error');
    xdc.useModule('xdc.runtime.Diags');
    xdc.useModule('xdc.runtime.Log');
    xdc.useModule('xdc.runtime.Memory');
    xdc.useModule('xdc.runtime.Registry');
    xdc.useModule('xdc.runtime.System');

    /* bring in target specific modules */
    var Program = xdc.useModule('xdc.cfg.Program');
    var targIsaChain = "/" + Program.build.target.getISAChain().join("/") + "/";

    if (targIsaChain.match("/64P/")) {
        xdc.useModule('ti.sdo.ipc.family.vayu.InterruptDsp');
    }
    else if (targIsaChain.match("/v7M/")) {
        xdc.useModule('ti.sdo.ipc.family.vayu.InterruptIpu');
    }
}
