import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

const usage0 = [
    '(in-package :api.neo4j)',
    '',
    '(setf *db* "noe4j")',
    '(setf *user* "neo4j")',
    '(setf *password* "password")',
];


const usage1 = [
    '(let ((stmt (concatenate \'string',
    '                         "MATCH (from:GENIUS)-[edge:HAVE_TO]->(to:FORCE) "',
    '                         "WHERE ID(from) = 1 "',
    '                         "RETURN from, edge, to")))',
    '  (neo4j:http :statements `((,stmt . nil))))',
];

const usage2 = [
    '(let ((stmt "CREATE (n $props) RETURN n"))',
    '  (neo4j:http :statements `((,stmt . (:|props| (:|name| "My Node" )))',
    '                            (,stmt . (:|props| (:|name| "Another Node"))))))',
];

export default function Overview () {
    const prestyle = {
        fontSize:14,
        lineHeight: '14px',
    };

    return (
        <Sections>
          <Section title="Overview">
            <Contents>
            </Contents>
          </Section>

          <Section title="Usage">
            <Contents><pre>{usage0.join('\n')}</pre></Contents>
            <Contents><pre>{usage1.join('\n')}</pre></Contents>
            <Contents><pre>{usage2.join('\n')}</pre></Contents>
          </Section>
        </Sections>
    );
}
