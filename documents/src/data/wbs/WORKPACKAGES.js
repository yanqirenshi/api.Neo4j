// 1234567
// 1000000 : class
// 1100000 : api
// 1200000 : procedures
// 1300000 : ???
// 1400000 : ???

function SEED_OPERATORS () {
    return [
        {
            _id: 1000000, _parent: 102,
            label: 'http',
            description: '',
        },
    ];
}
function SEED_VARIABLES () {
    return [
        {
            _id: 1100000, _parent: 103,
            label: '*db*',
            description: '',
        },
        {
            _id: 1100001, _parent: 103,
            label: '*user*',
            description: '',
        },
        {
            _id: 1100002, _parent: 103,
            label: '*password*',
            description: '',
        },
        {
            _id: 1100003, _parent: 103,
            label: '*scheme*',
            description: '',
        },
        {
            _id: 1100004, _parent: 103,
            label: '*host*',
            description: '',
        },
        {
            _id: 1100005, _parent: 103,
            label: '*port*',
            description: '',
        },
    ];
}
function SEED_CLASSES () {
    return [
    ];
}

const WORKPACKAGES = [
    ...SEED_OPERATORS(),
    ...SEED_VARIABLES(),
    ...SEED_CLASSES(),
].map(d => {
    const wp = {...d};
    wp._class = 'WORKPACKAGE';
    return wp;
});

export default WORKPACKAGES;
