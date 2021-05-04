import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

import Http from './operators/Http.js';
import Wbs from './Wbs.js';

const columns = [
    {
        label: 'Code',
        required: true,
        contents: (c, d) => {
            return <>{d._id}</>;
        }
    },
    {
        label: 'Name',
        leveling: true,
        required: true,
        contents: (c, d) => {
            return <>
                     <span>{d.label}</span>
                   </>;
        },
    },
    {
        label: 'Description',
        contents: (c, d) => {
            return d.description;
        }
    },
];

export default function Operators (props) {
    return (
        <Sections>
          <Http />

          <Section>
            <Contents>
              <Wbs wbs={props.wbs}
                   columns={columns}
                   start_id={102} />
            </Contents>
          </Section>
        </Sections>
    );
}
