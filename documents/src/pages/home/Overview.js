import React from 'react';
import {
    Sections, Section, Contents,
} from '../../components/Common.js';

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
            <Contents>
              <pre>{usage1.join('\n')}</pre>
            </Contents>

            <Contents>
              <pre>{usage2.join('\n')}</pre>
            </Contents>
          </Section>

          <Section title="http">
            <Contents>
            </Contents>

            <Section title="Values" level={4}>
              <Section title="result" level={5}>
                <Contents>
                </Contents>
              </Section>
            </Section>

            <Section title="Arguments" level={4}>

              <Section title="statements" level={5}>
                <Contents>
                </Contents>
              </Section>

              <Section title="commit-uri" level={5}>
                <Contents>
                </Contents>
              </Section>

              <Section title="commit" level={5}>
                <Contents>
                  <p>実行する <code>statements</code> でコミットする場合は t を指定します。</p>
                  <p>デフォルト値は <code>t</code> です。</p>
                  <p>この値が <code>nil</code> の場合、実行した <code>statements</code> はトランザクション実行となりコミットされていない状態になります。</p>
                  <p>別途 <code>commit-uri</code> でコミットする必要があります。</p>
                </Contents>
              </Section>

              <Section title="adjuster" level={5}>
                <Contents>
                  <p>API から取得した値を変換するための関数を指定します。</p>
                  <p>この関数では必ず値を返す必要があります。</p>
                  <p>この関数は行単位で実行されます。</p>
                  <p>関数の定義は以下の通りです。</p>
                  <p><pre>{"#'(lambda (row columns) ....)"}</pre></p>
                </Contents>
              </Section>

              <Section title="nature" level={5}>
                <Contents>
                  <p>返す値 <code>results</code> の形式を指定します。</p>
                  <p>t の場合は <a href="https://neo4j.com/docs/http-api/current/actions/begin-a-transaction/">Neo4j の API が返す値</a> をそのまま返します。</p>
                </Contents>
              </Section>

              <Section title="db" level={5}>
                <Contents>
                </Contents>
              </Section>

              <Section title="user" level={5}>
                <Contents>
                </Contents>
              </Section>

              <Section title="password" level={5}>
                <Contents>
                </Contents>
              </Section>

            </Section>

          </Section>
        </Sections>
    );
}
