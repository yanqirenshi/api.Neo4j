import React, { useState } from 'react';
import { useLocation } from "react-router-dom";

import Hero from '../components/Hero.js';

import Overview from './home/Overview.js';
import Variables from './home/Variables.js';
import Backlogs from './home/Backlogs.js';
import Operators from './home/Operators.js';
import Classes from './home/Classes.js';
import Wbs from './home/Wbs.js';

import * as WBS_DATA from '../data/WBS_DATA.js';

const wbs_data = {
    projects:     WBS_DATA.PROJECTS,
    wbs:          WBS_DATA.WBS,
    workpackages: WBS_DATA.WORKPACKAGES,
    edges:        WBS_DATA.EDGES,
};

function Home (props) {
    const [tabs] = useState([
        { code: 'overview',  label: 'Overview' },
        { code: 'operators', label: 'Operators' },
        { code: 'variables', label: 'variables' },
        { code: 'classes',   label: 'Classes' },
        { code: 'wbs',       label: 'Wbs' },
        { code: 'backlogs',  label: 'Backlogs' },
    ]);

    const search = new URLSearchParams(useLocation().search);
    const active_code = search.get('tab') || tabs[0].code || null;

    return (
        <>
          <Hero tabs={tabs}
                title="api.Neo4j" />

          {'overview'===active_code  && <Overview wbs={wbs_data} />}
          {'variables'===active_code && <Variables wbs={wbs_data} />}
          {'backlogs'===active_code  && <Backlogs wbs={wbs_data} sogh={props.sogh} repo={props.repo}/>}
          {'classes'===active_code   && <Classes wbs={wbs_data} />}
          {'operators'===active_code && <Operators wbs={wbs_data} />}
          {'wbs'===active_code       && <Wbs wbs={wbs_data} />}
        </>
    );
}

export default Home;
